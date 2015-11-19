vagrant-scaleio2
---------------

# Description

Vagrantfile to create a ScaleIO cluster. The Vagrantfile is flexible enough to allow the creation of a cluster of any size. It also allows the removal and addition of nodes to the cluster.

# Usage

This Vagrant setup will automatically deploy a number CentOS 6.5 nodes, download the ScaleIO 1.32 software and install a full ScaleIO cluster. The number of nodes to be deployed is specified in the `config/config.yml` file. A description of the format of that file is provided later in this document.

To use this, you'll need to complete a few steps:

1. `git clone https://github.com/dbblackdiamond/vagrant-scaleio2.git`
2. Edit the `config/config.yml` file to reflect the size of the cluster you want to deploy and the information relevant to your site. Please the the _**Configuration File Format**_ section below for more information on the format of the `config/config.yml` file.
3. Run `vagrant up` (if you have more than one Vagrant Provider on your machine run `vagrant up --provider virtualbox` instead)

Note, the cluster will come up with the default unlimited license for dev and test use.

## SSH
To login to the ScaleIO nodes, use the following commands: ```vagrant ssh <node name>```

## Configuration file format

The `config/config.yml` file contains a description of the configuration of the cluster you want to deploy, along with some variables that are required by the installation program and others that can be used to control things, such as the version of ScaleIO to install, or the location where to download the software from.
The configuration is flexible enough to allow you to create different Protection Domain and different Pool if you wish to.

The smallest cluster that can be deployed is a 3 nodes cluster, that contains:
1. A Cluster definition
2. A TB, or tie-breaker, node
3. A Primary MDM node
4. A Secondary MDM node.

Because ScaleIO requires at least 3 SDS, the TB, the Primary MDM and the Secondary MDM all will be configured as SDS as well.

After that, you can choose to deploy as many SDS or SDC nodes as you wish using the proper configuration. 
The `config/config.yml` includes other configuration variables, such as the name of the vagrant box, its URL, the version of ScaleIO to be deployed and the OS verions of the virtual mchaines. Those settings can be left alone for most deployments. It also contains the password that will be set for the **admin** user, which can be easily changed but changing the value of the `password:` line.

### Cluster Configuration
The Cluster configuration section contains the information about the cluster and the nodes that are being deployed.
The cluster configuration contains the following lines:
1. Name of the cluster
2. IP address of the cluster
3. Nodes.
The nodes line is the important one at the moment. This is where you specify which nodes you want to deploy. This line can also be updated at a later stage if you want to add a node to the cluster. This is as easily done as just adding the node name on that line.

Here is an example of the cluster configuration:
```
cluster:
   name: "ScaleIOTest"
   ip: "10.1.1.110"
   nodes: "tb,primary_mdm,secondary_mdm,sds4,sds5,sds6,sds7,sdc1,sdc2,gui1"
```

### TB Node Configuration
To configure a TB node, you'll need the following information:
1. Its hostname,
2. Its IP address
3. The full path of the device that will be added to the Pool
4. The size of the device
5. The Name of the SDS configured on the TB

Here is an example to configure a TB node called `tb1` and an IP address of `10.1.1.111`:
```
tb:
   name: "tb1"
   ip: "10.1.1.111"
   role: "tb"
```

### Primary MDM Configuration
To configure the Primary MDM node, you'll need the following information:
1. The Name of the Primary MDM Virtual Machine. This name will be the hostname of the VM
2. The IP address of the Primary MDM
3. The SDS Name the Primary MDM will be known as. The Primary MDM is also configured as a SDS Node
4. The Path for the device that will be used by the SDS configured on the Primary MDM
5. The size of the device
6. The Protection Domain the SDS configured on the Primary MDM needs to be added to
7. The Pool the device added to

Here is an example of a Primary MDM named `mdm1`:
```
primary_mdm:
   name: "mdm1"
   ip: "10.1.1.112"
   role: "primary mdm"
   sdsname: "sds2"
   device: "/home/vagrant/scaleio1"
   device_size: "100"
   protection_domain: "pdomain1"
   pool: "Pool1"
```

### Secondary MDM Configuration
The configuration of the Secondary MDM is really similar to the one of the Primary MDM. You'll need to provide the following information:
1. The Name of the Secondary MDM Virtual Machine. This name will be the hostname of the VM
2. The IP address of the Secondary MDM
3. The SDS Name the Secondary MDM will be known as. The Secondary MDM is also configured as a SDS Node
4. The Path for the device that will be used by the SDS configured on the Secondary MDM
5. The size of the device
6. The Protection Domain the SDS configured on the Secondary MDM needs to be added to
7. The Pool the device added to

Here is an example of the configuration of a Secondary MDM called `mdm2`:
```
secondary_mdm:
   name: "mdm2"
   ip: "10.1.1.113"
   role: "secondary mdm"
   sdsname: "sds3"
   device: "/home/vagrant/scaleio1"
   device_size: "100"
   protection_domain: "pdomain1"
   pool: "Pool1"
   ````

### SDS Node Configuration
SDS are the node providing capacity to the cluster. Each of the MDM is an SDS, but SDS-only node can also be deployed separately. To do that, the following information are needed:
1. SDS Hostname
2. SDS IP address
3. The full path of the file that will be used as a device to add capacity to the cluster
4. The size of the file. The minimum size of a device is 100GB. ScaleIO uses thin provisioning so there is no need to have 100GB available. 
5. The Protection domain the SDS is part of
6. The Pool the capacity is going to be added to

Here is an example of a SDS Node called `sds4`:
```
sds4:
   name: "sds4"
   ip: "10.1.1.114"
   role: "sds"
   device: "/home/vagrant/scaleio1"
   device_size: "100"
   protection_domain: "pdomain2"
   pool: "Pool1"
````

### SDC Node Configuration
In a ScaleIO cluster, the SDC is the consumer of the capacity presented by the SDS nodes. SDC are nodes that volumes are being presented to through IP. The following information are needed to deploy an SDC:
1. SDC Name
2. SDC IP address
3. The name of the volume that will be presented to this SDC
4. The size of the volume
5. The Protection Domain this SDC is going to be part of
6. The Pool that the volume is going to be part of

Here is an example of a SDC Node called `sdc1`:
```
sdc1:
   name: "sdc1"
   ip: "10.1.1.121"
   role: "sdc"
   volume: "test_vol1"
   volsize: "8"
   protection_domain: "pdomain1"
   pool: "Pool1"
```

### GUI Node Configuration
ScaleIO comes with its own management interface. You can choose to deploy it on your own laptop or workstation or you can choose to have it deployed as a separate node. If you choose a separate node, this is the information needed:
1. Name of the virtual machine to run the GUI
2. Its IP address

Here is an example of a GUI Node called `gui1`:
```
gui1:   
   name: "gui1"
   ip: "10.1.1.123"
   role: "gui"
   ```

## Access to the cluster
Once the `vagrant up` command has been run, you should be able ssh to the GUI node and start the Scaleio GUI by running `/opt/emc/scaleio/gui/run.sh`. Because a Linux virtual machine is deployed as a GUI server, it is important to export the display of your laptop or workstation before running the GUI. Alternatively, you can ssh to the GUI node and tunnel X over ssh.

## Updating the cluster
The cluster you have just deployed can be updated after the deployement. This is typically used to simulate a node failure or a node addition to the cluster. 
To simulate a node failure, you can run the `vagrant destroy -f <node name>` command. This will shutdown and destroy the virtual machine. Alternatively, if you only want to shutdown the virtual machine and not destroy it, you can run the `vagrant shutdown <node name>` command.
To simulate a node addition, you can add the node name the `nodes` list in the `cluster` definition section. Then you need to add the node definition section and run `vagrant up <node name>`.

# Troubleshooting
If anything goes wrong during the deployment, run `vagrant destroy -f` to remove all the VMs and then `vagrant up` again to restart the deployment.
