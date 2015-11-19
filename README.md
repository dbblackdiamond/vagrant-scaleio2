vagrant-scaleio2
---------------

# Description

Vagrantfile to create a ScaleIO cluster. The Vagrantfile is flexible enough to allow the creation of a cluster of any size. It also allows the removal and addition of nodes to the cluster.

# Usage

This Vagrant setup will automatically deploy a number CentOS 6.5 nodes, download the ScaleIO 1.32 software and install a full ScaleIO cluster. The number of nodes to be deployed is specified in the `config/config.yml` file. A description of the format of that file is provided later in this document.

To use this, you'll need to complete a few steps:

1. `git clone https://github.com/dbblackdiamond/vagrant-scaleio2.git`
2. Edit the `config/config.yml` file to reflect the size of the cluster you want to deploy and the information relevant to your site
3. Run `vagrant up` (if you have more than one Vagrant Provider on your machine run `vagrant up --provider virtualbox` instead)

Note, the cluster will come up with the default unlimited license for dev and test use.

### SSH
To login to the ScaleIO nodes, use the following commands: ```vagrant ssh <node name>```

## Configuration file format

The `config/config.yml` file contains a description of the configuration of the cluster you want to deploy, along with some variables that are required by the installation program and others that can be used to control things, such as the version of ScaleIO to install, or the location where to download the software from.
The smallest cluster that can be deployed is a 3 nodes cluster, that contains:
1. A TB, or tie-breaker, node
2. A Primary MDM node
3. A Secondary MDM node.

After that, you can choose to deploy as many SDS or SDC nodes as you wish using the proper configuration. 

### TB Node Configuration
To configure a TB node, you'll need the following information:
1. Its hostname,
2. Its IP address
3. ITs role, ie. tb

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

Here is an example of a GUI Node called `gui1`:
```
gui1:   
   name: "gui1"
   ip: "10.1.1.123"
   role: "gui"
   ```
   
### Cluster Configuration

Here is an example of the cluster configuration:
```
cluster:
   name: "ScaleIOTest"
   ip: "10.1.1.110"
   nodes: "tb1,primary_mdm,secondary_mdm,sds4,sds5,sds6,sds7,sdc1,sdc2,gui1"
```

## Access to the cluster
Once the `vagrant up` command has been run, you should be able ssh to the GUI node and start the Scaleio GUI by running `/opt/emc/scaleio/bin/run.sh`

# Troubleshooting
If anything goes wrong during the deployment, run `vagrant destroy -f` to remove all the VMs and then `vagrant up` again to restart the deployment.
