#!/bin/bash

while [[ $# > 1 ]]
do
  key="$1"

  case $key in
    -c|--config)
    CONFIGFILE="$2"
    shift
    ;;
    *)
    # unknown option
    ;;
  esac
  shift
done

source ${CONFIGFILE}

echo DEVICE  = "${DEVICE}"
echo DEVSIZE = "${DEVSIZE}"
echo VERSION    = "${VERSION}"
echo OS    = "${OS}"
echo PACKAGENAME    = "${PACKAGENAME}"
echo FIRSTMDMIP    = "${FIRSTMDMIP}"
echo SECONDMDMIP    = "${SECONDMDMIP}"
echo TBIP    = "${TBIP}"
echo PASSWORD    = "${PASSWORD}"
echo PDOMAIN = "${PDOMAIN}"
echo POOL = "${POOL}"
echo SDSNAME = "${SDSNAME}"
echo TBSDSNAME = ${TBSDSNAME}

# Create the file that will be used to add capacity to the Pool. The file is thin provisioned
truncate -s ${DEVSIZE} ${DEVICE}
yum install numactl libaio -y

# Downloading the latest files from EMC website
cd /vagrant
wget -nv ftp://ftp.emc.com/Downloads/ScaleIO/ScaleIO_RHEL6_Download.zip -O ScaleIO_RHEL6_Download.zip
unzip -o ScaleIO_RHEL6_Download.zip -d /vagrant/scaleio/

# Installing the ScaleIO Packages that were downloaded by the tb.sh script
cd /vagrant/scaleio/ScaleIO_1.32_RHEL6_Download
MDM_IP=${FIRSTMDMIP},${SECONDMDMIP} rpm -Uv ${PACKAGENAME}-mdm-${VERSION}.${OS}.x86_64.rpm
MDM_IP=${FIRSTMDMIP},${SECONDMDMIP} rpm -Uv ${PACKAGENAME}-sds-${VERSION}.${OS}.x86_64.rpm
MDM_IP=${FIRSTMDMIP},${SECONDMDMIP} rpm -Uv ${PACKAGENAME}-sdc-${VERSION}.${OS}.x86_64.rpm

# Configuring the Secondaring MDM
echo "Login into the MDM..."
scli --mdm_ip ${FIRSTMDMIP} --login --username admin --password ${PASSWORD}
echo "Adding the secondary MDM..."
scli --add_secondary_mdm --mdm_ip ${FIRSTMDMIP} --secondary_mdm_ip ${SECONDMDMIP}
echo "Secondary MDM has been added, waiting for 30 sec..."
sleep 30
echo "Adding Tie-Breaker to the cluster..."
scli --add_tb --mdm_ip ${FIRSTMDMIP} --tb_ip ${TBIP}
echo "TB added, waiting for 30 sec..."
sleep 30
echo "Switching to cluster mode...."
scli --switch_to_cluster_mode --mdm_ip ${FIRSTMDMIP}

echo "Trying to configure the Secondary MDM as an SDS..."
scli --add_sds --mdm_ip ${FIRSTMDMIP} --sds_ip ${SECONDMDMIP} --device_path ${DEVICE} --sds_name ${SDSNAME} --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL}
if [ $? -eq 7 ]; then
    sleep 30
    echo "Retrying..."
    scli --add_sds --mdm_ip ${FIRSTMDMIP} --sds_ip ${SECONDMDMIP} --device_path ${DEVICE} --sds_name ${SDSNAME} --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL}
    if [ $? -eq 7 ]; then
        sleep 30
        echo "Trying one last time..."
        scli --add_sds --mdm_ip ${FIRSTMDMIP} --sds_ip ${SECONDMDMIP} --device_path ${DEVICE} --sds_name ${SDSNAME} --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL}
        if [ $? -eq 7]; then
            echo "Failed to configure the MDM as an SDS, exiting..."
            exit 0
        fi
    fi
fi
echo "Secondary MDM successfully configured as a SDS..."

echo "Trying to configure the TB as an SDS..."
scli --add_sds --mdm_ip ${FIRSTMDMIP} --sds_ip ${TBIP} --device_path ${DEVICE} --sds_name ${TBSDSNAME} --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL}
if [ $? -eq 7 ]; then
    sleep 30
    echo "Retrying..."
    scli --add_sds --mdm_ip ${FIRSTMDMIP} --sds_ip ${TBIP} --device_path ${DEVICE} --sds_name ${TBSDSNAME} --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL}
    if [ $? -eq 7 ]; then
        sleep 30
        echo "Trying one last time..."
        scli --add_sds --mdm_ip ${FIRSTMDMIP} --sds_ip ${TBIP} --device_path ${DEVICE} --sds_name ${TBSDSNAME} --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL}
        if [ $? -eq 7 ]; then
            echo "Failed to configure the MDM as an SDS, exiting..."
            exit 0
        fi
    fi
fi
echo "TB successfully configured as a SDS..."

echo "Copying private key to vagrant user..."
cp /vagrant/vagrant.private /home/vagrant/.ssh/id_rsa
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
chmod 600 /home/vagrant/.ssh/id_rsa

echo "Copying private key to root user..."
mkdir /root/.ssh
cp /vagrant/vagrant.private /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

if [[ -n $1 ]]; then
  echo "Last line of file specified as non-opt/last argument:"
  tail -1 $1
fi

echo "Sleeping for 30 seconds to make sure everything comes up..."
sleep 30
