# Updated by Bertrand Sirodot
# Created by Jonas Rosland, @virtualswede & Matt Cowger, @mcowger
# Many thanks to this post by James Carr: http://blog.james-carr.org/2013/03/17/dynamic-vagrant-nodes/

require 'yaml'

# Loading the Configuration file
env = YAML.load_file("config/config.yml")

password = env['password']
domain = env['domain']
version = env['version']
os = env['os']
packagename = env['packagename']
provider = env['provider']

##### Vagrant Script ######
primary_mdmip = ""
secondary_mdmip = ""
tbip = ""

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
			node_config.vm.box = env['vagrantbox']
			node_config.vm.box_url = env['vagrantboxurl']
			node_config.vm.host_name = "#{name}.#{domain}"
			node_config.ssh.insert_key = false
	    	if env[node]['role'] == "tb"
				tbip = ip
                device = env[node]['device']
                device_size = env[node]['device_size']
                if provider == "virtualbox"
    			    node_config.vm.provider :virtualbox do |vb|
	    			    vb.customize ["modifyvm", :id, "--memory", "1024"]
		    	    end
			    	node_config.vm.network "public_network", bridge: "p4p1", ip: "#{ip}"
                elsif provider == "vsphere"
                    node_config.vm.network "private_network", ip: "#{ip}"
                    node_config.vm.provider :vsphere do |vsphere|
                        vsphere.host = env['vsphere']['vcenter_host']
                        vsphere.name = name
                        vsphere.customization_spec_name = env['vsphere']['custom_spec_name']
                        vsphere.data_center_name = env['vsphere']['data_center_name']
                        vsphere.compute_resource_name = env['vsphere']['compute_name']
                        vsphere.clone_from_vm = false
                        vsphere.template_name = env['vsphere']['template_name']
                        vsphere.data_store_name = env['vsphere']['data_store_name']
                        vsphere.memory_mb = env['vsphere']['memory']
                        vsphere.cpu_count = env['vsphere']['cpu']
                        vsphere.user = env['vsphere']['user']
                        vsphere.password = env['vsphere']['password']
                        vsphere.insecure = true
                    end
                else 
                    puts "A provider needs to be defined. The two supported are vsphere and virtualbox.\n"
                    break
                end
                fconfig = File.open("files/#{name}.cfg", "w+")
                fconfig.puts "OS=#{os}\n"
                fconfig.puts "DEVICE=#{env[node]['device']}\n"
                fconfig.puts "DEVSIZE=#{env[node]['device_size']}GB\n"
                fconfig.puts "VERSION=#{version}\n"
                fconfig.puts "PACKAGENAME=#{packagename}\n"
                fconfig.puts "FIRSTMDMIP=#{primary_mdmip}\n"
                fconfig.puts "SECONDMDMIP=#{secondary_mdmip}\n"
                fconfig.close
				node_config.vm.provision "shell" do |s|
				    s.path = "scripts/tb.sh"
    				s.args = "-c /vagrant/files/#{name}.cfg"
	    		end
			elsif env[node]['role'] == "primary mdm"
				sdsname = env[node]['sdsname']
				device = env[node]['device']
				device_size = env[node]['device_size']
				pdomain = env[node]['protection_domain']
				pool = env[node]['pool']
                if provider == "virtualbox"
    			    node_config.vm.provider :virtualbox do |vb|
	    			    vb.customize ["modifyvm", :id, "--memory", "1024"]
		    	    end
			    	node_config.vm.network "public_network", bridge: "p4p1", ip: "#{ip}"
                elsif provider == "vsphere"
                    node_config.vm.network "private_network", ip: "#{ip}"
                    node_config.vm.provider :vsphere do |vsphere|
                        vsphere.host = env['vsphere']['vcenter_host']
                        vsphere.name = name
                        vsphere.customization_spec_name = env['vsphere']['custom_spec_name']
                        vsphere.data_center_name = env['vsphere']['data_center_name']
                        vsphere.compute_resource_name = env['vsphere']['compute_name']
                        vsphere.clone_from_vm = false
                        vsphere.template_name = env['vsphere']['template_name']
                        vsphere.data_store_name = env['vsphere']['data_store_name']
                        vsphere.memory_mb = env['vsphere']['memory']
                        vsphere.cpu_count = env['vsphere']['cpu']
                        vsphere.user = env['vsphere']['user']
                        vsphere.password = env['vsphere']['password']
                        vsphere.insecure = true
                    end
                else 
                    puts "A provider needs to be defined. The two supported are vsphere and virtualbox.\n"
                    break
                end
                fconfig = File.open("files/#{name}.cfg", "w+")
                fconfig.puts "OS=#{os}\n"
                fconfig.puts "DEVICE=#{env[node]['device']}\n"
                fconfig.puts "DEVSIZE=#{env[node]['device_size']}GB\n"
                fconfig.puts "VERSION=#{version}\n"
                fconfig.puts "PACKAGENAME=#{packagename}\n"
                fconfig.puts "FIRSTMDMIP=#{primary_mdmip}\n"
                fconfig.puts "SECONDMDMIP=#{secondary_mdmip}\n"
                fconfig.puts "PDOMAIN=#{env[node]['protection_domain']}\n"
                fconfig.puts "POOL=#{env[node]['pool']}\n"
                fconfig.puts "SDSNAME=#{env[node]['sdsname']}\n"
                fconfig.puts "PASSWORD=#{password}\n"
                fconfig.close
    			node_config.vm.provision "shell" do |s|
	    			s.path = "scripts/primary_mdm.sh"
		   			s.args = "-c /vagrant/files/#{name}.cfg"
		    	end
			elsif env[node]['role'] == "secondary mdm"
				sdsname = env[node]['sdsname']
				device = env[node]['device']
				device_size = env[node]['device_size']
				pdomain = env[node]['protection_domain']
				pool = env[node]['pool']
				tbip = env[cluster['nodes'].split(',')[0]]['ip']
				tbsdsname = env[cluster['nodes'].split(',')[0]]['sdsname']
                if provider == "virtualbox"
    			    node_config.vm.provider :virtualbox do |vb|
	    			    vb.customize ["modifyvm", :id, "--memory", "1024"]
		    	    end
			    	node_config.vm.network "public_network", bridge: "p4p1", ip: "#{ip}"
                elsif provider == "vsphere"
                    node_config.vm.network "private_network", ip: "#{ip}"
                    node_config.vm.provider :vsphere do |vsphere|
                        vsphere.host = env['vsphere']['vcenter_host']
                        vsphere.name = name
                        vsphere.customization_spec_name = env['vsphere']['custom_spec_name']
                        vsphere.data_center_name = env['vsphere']['data_center_name']
                        vsphere.compute_resource_name = env['vsphere']['compute_name']
                        vsphere.clone_from_vm = false
                        vsphere.template_name = env['vsphere']['template_name']
                        vsphere.data_store_name = env['vsphere']['data_store_name']
                        vsphere.memory_mb = env['vsphere']['memory']
                        vsphere.cpu_count = env['vsphere']['cpu']
                        vsphere.user = env['vsphere']['user']
                        vsphere.password = env['vsphere']['password']
                        vsphere.insecure = true
                    end
                else 
                    puts "A provider needs to be defined. The two supported are vsphere and virtualbox.\n"
                    break
                end
                fconfig = File.open("files/#{name}.cfg", "w+")
                fconfig.puts "OS=#{os}\n"
                fconfig.puts "DEVICE=#{env[node]['device']}\n"
                fconfig.puts "DEVSIZE=#{env[node]['device_size']}GB\n"
                fconfig.puts "VERSION=#{version}\n"
                fconfig.puts "PACKAGENAME=#{packagename}\n"
                fconfig.puts "FIRSTMDMIP=#{primary_mdmip}\n"
                fconfig.puts "SECONDMDMIP=#{secondary_mdmip}\n"
                fconfig.puts "PDOMAIN=#{env[node]['protection_domain']}\n"
                fconfig.puts "POOL=#{env[node]['pool']}\n"
                fconfig.puts "SDSNAME=#{env[node]['sdsname']}\n"
                fconfig.puts "PASSWORD=#{password}\n"
                fconfig.puts "TBIP=#{tbip}\n"
                fconfig.puts "TBSDSNAME=#{tbsdsname}\n"
                fconfig.close
				node_config.vm.provision "shell" do |s|
					s.path = "scripts/secondary_mdm.sh"
					s.args = "-c /vagrant/files/#{name}.cfg"
				end
			elsif env[node]['role'] == "sds"
				device = env[node]['device']
				device_size = env[node]['device_size']
				pdomain = env[node]['protection_domain']
				pool = env[node]['pool']
                if provider == "virtualbox"
    			    node_config.vm.provider :virtualbox do |vb|
	    			    vb.customize ["modifyvm", :id, "--memory", "1024"]
		    	    end
			    	node_config.vm.network "public_network", bridge: "p4p1", ip: "#{ip}"
                elsif provider == "vsphere"
                    node_config.vm.network "private_network", ip: "#{ip}"
                    node_config.vm.provider :vsphere do |vsphere|
                        vsphere.host = env['vsphere']['vcenter_host']
                        vsphere.name = name
                        vsphere.customization_spec_name = env['vsphere']['custom_spec_name']
                        vsphere.data_center_name = env['vsphere']['data_center_name']
                        vsphere.compute_resource_name = env['vsphere']['compute_name']
                        vsphere.clone_from_vm = false
                        vsphere.template_name = env['vsphere']['template_name']
                        vsphere.data_store_name = env['vsphere']['data_store_name']
                        vsphere.memory_mb = env['vsphere']['memory']
                        vsphere.cpu_count = env['vsphere']['cpu']
                        vsphere.user = env['vsphere']['user']
                        vsphere.password = env['vsphere']['password']
                        vsphere.insecure = true
                    end
                else 
                    puts "A provider needs to be defined. The two supported are vsphere and virtualbox.\n"
                    break
                end
                fconfig = File.open("files/#{name}.cfg", "w+")
                fconfig.puts "OS=#{os}\n"
                fconfig.puts "DEVICE=#{env[node]['device']}\n"
                fconfig.puts "DEVSIZE=#{env[node]['device_size']}GB\n"
                fconfig.puts "VERSION=#{version}\n"
                fconfig.puts "PACKAGENAME=#{packagename}\n"
                fconfig.puts "FIRSTMDMIP=#{primary_mdmip}\n"
                fconfig.puts "SECONDMDMIP=#{secondary_mdmip}\n"
                fconfig.puts "PDOMAIN=#{env[node]['protection_domain']}\n"
                fconfig.puts "POOL=#{env[node]['pool']}\n"
                fconfig.puts "SDSNAME=#{env[node]['name']}\n"
                fconfig.puts "SDSIP=#{env[node]['ip']}\n"
                fconfig.puts "PASSWORD=#{password}\n"
                fconfig.close
				node_config.vm.provision "shell" do |s|
					s.path = "scripts/sds.sh"
					s.args = "-c /vagrant/files/#{name}.cfg"
				end
			elsif env[node]['role'] == "sdc"
				volume = env[node]['volume']
				volsize = env[node]['volsize']
				pdomain = env[node]['protection_domain']
				pool = env[node]['pool']
                if provider == "virtualbox"
    			    node_config.vm.provider :virtualbox do |vb|
	    			    vb.customize ["modifyvm", :id, "--memory", "1024"]
		    	    end
			    	node_config.vm.network "public_network", bridge: "p4p1", ip: "#{ip}"
                elsif provider == "vsphere"
                    node_config.vm.network "private_network", ip: "#{ip}"
                    node_config.vm.provider :vsphere do |vsphere|
                        vsphere.host = env['vsphere']['vcenter_host']
                        vsphere.name = name
                        vsphere.customization_spec_name = env['vsphere']['custom_spec_name']
                        vsphere.data_center_name = env['vsphere']['data_center_name']
                        vsphere.compute_resource_name = env['vsphere']['compute_name']
                        vsphere.clone_from_vm = false
                        vsphere.template_name = env['vsphere']['template_name']
                        vsphere.data_store_name = env['vsphere']['data_store_name']
                        vsphere.memory_mb = env['vsphere']['memory']
                        vsphere.cpu_count = env['vsphere']['cpu']
                        vsphere.user = env['vsphere']['user']
                        vsphere.password = env['vsphere']['password']
                        vsphere.insecure = true
                    end
                else 
                    puts "A provider needs to be defined. The two supported are vsphere and virtualbox.\n"
                    break
                end
                fconfig = File.open("files/#{name}.cfg", "w+")
                fconfig.puts "OS=#{os}\n"
                fconfig.puts "VOLNAME=#{env[node]['volume']}\n"
                fconfig.puts "VOLSIZE=#{env[node]['volsize']}\n"
                fconfig.puts "VERSION=#{version}\n"
                fconfig.puts "PACKAGENAME=#{packagename}\n"
                fconfig.puts "FIRSTMDMIP=#{primary_mdmip}\n"
                fconfig.puts "SECONDMDMIP=#{secondary_mdmip}\n"
                fconfig.puts "PDOMAIN=#{env[node]['protection_domain']}\n"
                fconfig.puts "POOL=#{env[node]['pool']}\n"
                fconfig.puts "SDCNAME=#{env[node]['name']}\n"
                fconfig.puts "SDCIP=#{env[node]['ip']}\n"
                fconfig.puts "PASSWORD=#{password}\n"
                fconfig.close
				node_config.vm.provision "shell" do |s|
					s.path = "scripts/sdc.sh"
					s.args = "-c /vagrant/files/#{name}.cfg"
				end
			elsif env[node]['role'] == "gui"
				node_config.ssh.forward_x11 = true
                if provider == "virtualbox"
    			    node_config.vm.provider :virtualbox do |vb|
	    			    vb.customize ["modifyvm", :id, "--memory", "1024"]
		    	    end
			    	node_config.vm.network "public_network", bridge: "p4p1", ip: "#{ip}"
                elsif provider == "vsphere"
                    node_config.vm.network "private_network", ip: "#{ip}"
                    node_config.vm.provider :vsphere do |vsphere|
                        vsphere.host = env['vsphere']['vcenter_host']
                        vsphere.name = name
                        vsphere.customization_spec_name = env['vsphere']['custom_spec_name']
                        vsphere.data_center_name = env['vsphere']['data_center_name']
                        vsphere.compute_resource_name = env['vsphere']['compute_name']
                        vsphere.clone_from_vm = false
                        vsphere.template_name = env['vsphere']['template_name']
                        vsphere.data_store_name = env['vsphere']['data_store_name']
                        vsphere.memory_mb = env['vsphere']['memory']
                        vsphere.cpu_count = env['vsphere']['cpu']
                        vsphere.user = env['vsphere']['user']
                        vsphere.password = env['vsphere']['password']
                        vsphere.insecure = true
                    end
                else 
                    puts "A provider needs to be defined. The two supported are vsphere and virtualbox.\n"
                    break
                end
				node_config.vm.provision "shell" do |s|
					s.path = "scripts/gui.sh"
					s.args = "-v #{version} -n #{packagename} "
				end
			end
		end		
	end
end

