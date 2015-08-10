# Updated by Bertrand Sirodot
# Created by Jonas Rosland, @virtualswede & Matt Cowger, @mcowger
# Many thanks to this post by James Carr: http://blog.james-carr.org/2013/03/17/dynamic-vagrant-nodes/


##### Cluster Definition #######
# This is where your cluster gets defined. 
# A cluster has 3 required role: tb, primary mdm and secondary mdm. 
# All of them also act as SDS and SDC, so those packages will get installed as part of the installation process.
# The order in which the nodes are defined should always be TB first, then MDMs, and then SDS'

# add your nodes here
tb = { 'name' => "tb1", 'ip' => "10.1.1.111", 'role' => "tb", 'sdsname' => "sds1", 'device' => "/home/vagrant/scaleio1", 'device_size' => "100", 'protection_domain' => "pdomain", 'pool' => "pool1" }
primary_mdm = { 'name' => "mdm1", 'ip' => "10.1.1.112", 'role' => "primary mdm", 'sdsname' => "sds2", 'device' => "/home/vagrant/scaleio1", 'device_size' => "100", 'protection_domain' => "pdomain1", 'pool' => "Pool1" }
secondary_mdm = { 'name' => "mdm2", 'ip' => "10.1.1.113", 'role' => "secondary mdm", 'sdsname' => "sds3", 'device' => "/home/vagrant/scaleio1", 'device_size' => "100", 'protection_domain' => "pdomain1", 'pool' => "Pool1"  }
sds4 = { 'name' => "sds4", 'ip' => "10.1.1.114", 'role' => "sds", 'device' => "/home/vagrant/scaleio1", 'device_size' => '100', 'protection_domain' => "pdomain2", 'pool' => "Pool1" }
sds5 = { 'name' => "sds5", 'ip' => "10.1.1.115", 'role' => "sds", 'device' => "/home/vagrant/scaleio1", 'device_size' => '100', 'protection_domain' => "pdomain2", 'pool' => "Pool1" }
sds6 = { 'name' => "sds6", 'ip' => "10.1.1.118", 'role' => "sds", 'device' => "/home/vagrant/scaleio1", 'device_size' => '100', 'protection_domain' => "pdomain1", 'pool' => "Pool1" }
sds7 = { 'name' => "sds7", 'ip' => "10.1.1.119", 'role' => "sds", 'device' => "/home/vagrant/scaleio1", 'device_size' => '100', 'protection_domain' => "pdomain2", 'pool' => "Pool1" }
sds8 = { 'name' => "sds8", 'ip' => "10.1.1.120", 'role' => "sds", 'device' => "/home/vagrant/scaleio1", 'device_size' => '100', 'protection_domain' => "pdomain2", 'pool' => "Pool2" }
sds9 = { 'name' => "sds9", 'ip' => "10.1.1.121", 'role' => "sds", 'device' => "/home/vagrant/scaleio1", 'device_size' => '100', 'protection_domain' => "pdomain1", 'pool' => "Pool2" }
sds10 = { 'name' => "sds10", 'ip' => "10.1.1.122", 'role' => "sds", 'device' => "/home/vagrant/scaleio1", 'device_size' => '100', 'protection_domain' => "pdomain2", 'pool' => "Pool2" }
sdc1 = { 'name' => "sdc1", 'ip' => "10.1.1.116", 'role' => "sdc", 'volume' => "test_vol1", 'volsize' => "8", 'protection_domain' => "pdomain1", 'pool' => "Pool1" }
sdc2 = { 'name' => "sdc2", 'ip' => "10.1.1.117", 'role' => "sdc", 'volume' => "test_vol2", 'volsize' => "8", 'protection_domain' => "pdomain2", 'pool' => "Pool1" }
gui1 = { 'name' => "gui1", 'ip' => "10.1.1.123", 'role' => "gui" }
nodes = [tb, primary_mdm, secondary_mdm, sds4, sds5, sds6, sds7, sds8, sds9, sds10, sdc1, sdc2, gui1]
cluster = { 'name' => "ScaleIOTest", 'ip' => "10.1.1.110", 'nodes' => nodes }


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

cluster['nodes'].each do |node|
	if node['role'] == "primary mdm"
		primary_mdmip = node['ip']
	elsif node['role'] == "secondary mdm"
			secondary_mdmip = node['ip']
	end
end
		

Vagrant.configure("2") do |config|
	cluster['nodes'].each do |node|
		name = node['name']
		ip = node['ip']
		config.vm.define name do |node_config|
			node_config.vm.box = "#{vagrantbox}"
			node_config.vm.box_url = "#{vagrantboxurl}"
			node_config.vm.host_name = "#{name}.#{domain}"
			node_config.vm.provider :virtualbox do |vb|
				vb.customize ["modifyvm", :id, "--memory", "1024"]
			end
			node_config.ssh.insert_key = false
	    	if node['role'] == "tb"
				tbip = ip
				netint = node['netint']
				device = node['device'] 
				device_size = node['device_size'] 
				node_config.vm.network "private_network", ip: "#{ip}"
				node_config.vm.provision "shell" do |s|
					s.path = "scripts/tb.sh"
					s.args = "-o #{os} -v #{version} -n #{packagename} -d #{device} -z #{device_size} -f #{primary_mdmip} -s #{secondary_mdmip} -i #{siinstall} -c #{clusterinstall}"
				end
			elsif node['role'] == "primary mdm"
				sdsname = node['sdsname']
				device = node['device']
				device_size = node['device_size']
				pdomain = node['protection_domain']
				pool = node['pool']
				node_config.vm.network "private_network", ip: "#{ip}"
				node_config.vm.provision "shell" do |s|
					s.path = "scripts/primary_mdm.sh"
					s.args = "-o #{os} -v #{version} -n #{packagename} -d #{device} -z #{device_size} -f #{primary_mdmip} -s #{secondary_mdmip} -i #{siinstall} -c #{clusterinstall} -pd #{pdomain} -po #{pool} -sd #{sdsname} -p #{password} "
				end
			elsif node['role'] == "secondary mdm"
				sdsname = node['sdsname']
				device = node['device']
				device_size = node['device_size']
				pdomain = node['protection_domain']
				pool = node['pool']
				tbip = cluster['nodes'][0]['ip']
				tbsdsname = cluster['nodes'][0]['sdsname']
				node_config.vm.network "private_network", ip: "#{ip}"
				node_config.vm.provision "shell" do |s|
					s.path = "scripts/secondary_mdm.sh"
					s.args = "-o #{os} -v #{version} -n #{packagename} -d #{device} -z #{device_size} -f #{primary_mdmip} -s #{secondary_mdmip} -i #{siinstall} -c #{clusterinstall} -pd #{pdomain} -po #{pool} -sd #{sdsname} -p #{password} -t #{tbip} -ts #{tbsdsname} "
				end
			elsif node['role'] == "sds"
				device = node['device']
				device_size = node['device_size']
				pdomain = node['protection_domain']
				pool = node['pool']
				node_config.vm.network "private_network", ip: "#{ip}"
				node_config.vm.provision "shell" do |s|
					s.path = "scripts/sds.sh"
					s.args = "-o #{os} -v #{version} -n #{packagename} -d #{device} -z #{device_size} -p #{password} -f #{primary_mdmip} -si #{ip} -pd #{pdomain} -po #{pool} -sd #{name} "
				end
			elsif node['role'] == "sdc"
				volume = node['volume']
				volsize = node['volsize']
				pdomain = node['protection_domain']
				pool = node['pool']
				node_config.vm.network "private_network", ip: "#{ip}"
				node_config.vm.provision "shell" do |s|
					s.path = "scripts/sdc.sh"
					s.args = "-o #{os} -v #{version} -n #{packagename} -vn #{volume} -z #{volsize} -p #{password} -f #{primary_mdmip} -s #{secondary_mdmip} -si #{ip} -pd #{pdomain} -po #{pool} -sd #{name} "
				end
			elsif node['role'] == "gui"
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

