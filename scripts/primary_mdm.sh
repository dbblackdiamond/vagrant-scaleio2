#!/bin/bash
while [[ $# > 1 ]]
do
  key="$1"

  case $key in
    -o|--os)
    OS="$2"
    shift
    ;;
    -d|--device)
    DEVICE="$2"
    shift
    ;;
	-z|--device_size)
	DEVSIZE="${2}GB"
	shift
	;;
    -v|--version)
    VERSION="$2"
    shift
    ;;
    -n|--packagename)
    PACKAGENAME="$2"
    shift
    ;;
    -f|--firstmdmip)
    FIRSTMDMIP="$2"
    shift
    ;;
	-s|--secondmdmip)
	SECONDMDMIP="$2"
	shift
	;;
    -p|--password)
    PASSWORD="$2"
    shift
    ;;
	-pd|--protection_domain)
	PDOMAIN="$2"
	shift
	;;
	-po|--pool)
	POOL="$2"
	shift
	;;
	-sd|--sdsname)
	SDSNAME="$2"
	shift
	;;
    *)
    # unknown option
    ;;
  esac
  shift
done
echo "Running Primary MDM Configuration Script with IP address ${FIRSTMDMIP}..."
echo DEVICE  = "${DEVICE}"
echo DEVSIZE = "${DEVSIZE}"
echo VERSION    = "${VERSION}"
echo OS    = "${OS}"
echo PACKAGENAME    = "${PACKAGENAME}"
echo FIRSTMDMIP    = "${FIRSTMDMIP}"
echo SECONDMDMIP = "${SECONDMDMIP}"
echo PDOMAIN = "${PDOMAIN}"
echo POOL = "${POOL}"
echo SDSNAME = "${SDSNAME}"
echo PASSWORD = "${PASSWORD}"

# Creating the file that will be used to add capacity to the Pool. The file is thin provisioned
truncate -s ${DEVSIZE} ${DEVICE}
yum install numactl libaio -y
yum install java-1.7.0-openjdk -y


# Installign the ScaleIO Packages
cd /vagrant/scaleio/ScaleIO_1.32_RHEL6_Download
MDM_IP=${FIRSTMDMIP},${SECONDMDMIP} rpm -Uv ${PACKAGENAME}-mdm-${VERSION}.${OS}.x86_64.rpm
MDM_IP=${FIRSTMDMIP},${SECONDMDMIP} rpm -Uv ${PACKAGENAME}-sds-${VERSION}.${OS}.x86_64.rpm
MDM_IP=${FIRSTMDMIP},${SECONDMDMIP} rpm -Uv ${PACKAGENAME}-sdc-${VERSION}.${OS}.x86_64.rpm

# Configuring the primary MDM
echo "Adding primary MDM...."
scli --mdm --add_primary_mdm --primary_mdm_ip ${FIRSTMDMIP} --accept_license
echo "Waiting for the MDM to come up, sleeping for 30sec..."
sleep 30
echo "Login into the new MDM...."
scli --login --mdm_ip ${FIRSTMDMIP} --username admin --password admin
echo "Changing default password...."
scli --mdm_ip ${FIRSTMDMIP} --set_password --old_password admin --new_password ${PASSWORD}
echo "Password changed... reloging into the MDM... "
scli --mdm_ip ${FIRSTMDMIP} --login --username admin --password ${PASSWORD}
echo "Adding protection domain..."
scli --add_protection_domain --mdm_ip ${FIRSTMDMIP} --protection_domain_name ${PDOMAIN}
echo "Adding storage pool...."
scli --add_storage_pool --mdm_ip ${FIRSTMDMIP} --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL}
echo "Configuring the MDM as an SDS..."
scli --add_sds --mdm_ip ${FIRSTMDMIP} --sds_ip ${FIRSTMDMIP} --device_path ${DEVICE} --sds_name ${SDSNAME} --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL}

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
