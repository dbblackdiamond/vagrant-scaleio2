# Updated by Bertrand Sirodot
# Created by Jonas Rosland, @virtualswede & Matt Cowger, @mcowger
# Many thanks to this post by James Carr: http://blog.james-carr.org/2013/03/17/dynamic-vagrant-nodes/

require 'yaml'

##### Cluster Definition #######
# This is where your cluster gets defined. 
# A cluster has 3 required role: tb, primary mdm and secondary mdm. 
# All of them also act as SDS and SDC, so those packages will get installed as part of the installation process.
# The order in which the nodes are defined should always be TB first, then MDMs, and then SDS'


###### Static Variables Definitions ######
###### This variables are used to define some constant used by the various scripts
# vagrant box
vagrantbox="centos_6.5"

# vagrant box url
vagrantboxurl="https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"

# scaleio admin password
password="Scaleio123"
# add your domain here
domain = 'scaleio.local'

# version of installation package
version = "1.32-402.1"

#OS Version of package
os="el6"
# Install ScaleIO cluster automatically or IM only

clusterinstall = "True" #If True a fully working ScaleIO cluster is installed. False mean only IM is installed on node MDM1.

# installation folder
siinstall = "/opt/scaleio/siinstall"

# packages folder
packages = "/opt/scaleio/siinstall/ECS/packages"
# package name, was ecs for 1.21, is now EMC-ScaleIO from 1.30
packagename = "EMC-ScaleIO"


##### Vagrant Script ######
primary_mdmip = ""
secondary_mdmip = ""
tbip = ""

env = YAML.load_file("config/config.yml")
cluster = env['cluster']
cluster['nodes'].split(',').each do |node|
    if env[node]['role'] == "primary mdm"
        primary_mdmip = env[node]['ip']
    elsif env[node]['role'] == "secondary mdm"
        secondary_mdmip = env[node]['ip']
    end
end
		

Vagrant.configure("2") do |config|
	cluster['nodes'].split(',').each do |node|
		name = env[node]['name']
		ip = env[node]['ip']
		config.vm.define name do |node_config|
			node_config.vm.box = "#{vagrantbox}"
			node_config.vm.box_url = "#{vagrantboxurl}"
			node_config.vm.host_name = "#{name}.#{domain}"
			node_config.vm.provider :virtualbox do |vb|
				vb.customize ["modifyvm", :id, "--memory", "1024"]
			end
			node_config.ssh.insert_key = false
	    	if env[node]['role'] == "tb"
				tbip = ip
				device = env[node]['device'] 
				device_size = env[node]['device_size'] 
				node_config.vm.network "private_network", ip: "#{ip}"
				node_config.vm.provision "shell" do |s|
					s.path = "scripts/tb.sh"
					s.args = "-o #{os} -v #{version} -n #{packagename} -d #{device} -z #{device_size} -f #{primary_mdmip} -s #{secondary_mdmip} -i #{siinstall} -c #{clusterinstall}"
				end
			elsif env[node]['role'] == "primary mdm"
				sdsname = env[node]['sdsname']
				device = env[node]['device']
				device_size = env[node]['device_size']
				pdomain = env[node]['protection_domain']
				pool = env[node]['pool']
				node_config.vm.network "private_network", ip: "#{ip}"
				node_config.vm.provision "shell" do |s|
					s.path = "scripts/primary_mdm.sh"
					s.args = "-o #{os} -v #{version} -n #{packagename} -d #{device} -z #{device_size} -f #{primary_mdmip} -s #{secondary_mdmip} -i #{siinstall} -c #{clusterinstall} -pd #{pdomain} -po #{pool} -sd #{sdsname} -p #{password} "
				end
			elsif env[node]['role'] == "secondary mdm"
				sdsname = env[node]['sdsname']
				device = env[node]['device']
				device_size = env[node]['device_size']
				pdomain = env[node]['protection_domain']
				pool = env[node]['pool']
				tbip = cluster['nodes'][0]['ip']
				tbsdsname = cluster['nodes'][0]['sdsname']
				node_config.vm.network "private_network", ip: "#{ip}"
				node_config.vm.provision "shell" do |s|
					s.path = "scripts/secondary_mdm.sh"
					s.args = "-o #{os} -v #{version} -n #{packagename} -d #{device} -z #{device_size} -f #{primary_mdmip} -s #{secondary_mdmip} -i #{siinstall} -c #{clusterinstall} -pd #{pdomain} -po #{pool} -sd #{sdsname} -p #{password} -t #{tbip} -ts #{tbsdsname} "
				end
			elsif env[node]['role'] == "sds"
				device = env[node]['device']
				device_size = env[node]['device_size']
				pdomain = env[node]['protection_domain']
				pool = env[node]['pool']
				node_config.vm.network "private_network", ip: "#{ip}"
				node_config.vm.provision "shell" do |s|
					s.path = "scripts/sds.sh"
					s.args = "-o #{os} -v #{version} -n #{packagename} -d #{device} -z #{device_size} -p #{password} -f #{primary_mdmip} -si #{ip} -pd #{pdomain} -po #{pool} -sd #{name} "
				end
			elsif env[node]['role'] == "sdc"
				volume = env[node]['volume']
				volsize = env[node]['volsize']
				pdomain = env[node]['protection_domain']
				pool = env[node]['pool']
				node_config.vm.network "private_network", ip: "#{ip}"
				node_config.vm.provision "shell" do |s|
					s.path = "scripts/sdc.sh"
					s.args = "-o #{os} -v #{version} -n #{packagename} -vn #{volume} -z #{volsize} -p #{password} -f #{primary_mdmip} -s #{secondary_mdmip} -si #{ip} -pd #{pdomain} -po #{pool} -sd #{name} "
				end
			elsif env[node]['role'] == "gui"
				node_config.vm.network "private_network", ip: "#{ip}"
				node_config.ssh.forward_x11 = true
				node_config.vm.provision "shell" do |s|
					s.path = "scripts/gui.sh"
					s.args = "-v #{version} -n #{packagename} "
				end
			end
		end		
	end
end

