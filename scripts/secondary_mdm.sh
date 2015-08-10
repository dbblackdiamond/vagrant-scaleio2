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
    -i|--installpath)
    INSTALLPATH="$2"
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
    -t|--tbip)
    TBIP="$2"
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
    -c|--clusterinstall)
    CLUSTERINSTALL="$2"
    shift
    ;;
    -ts|--tbsdsname)
    TBSDSNAME="$2"
    shift
    ;;

    *)
    # unknown option
    ;;
  esac
  shift
done
echo DEVICE  = "${DEVICE}"
echo DEVSIZE = "${DEVSIZE}"
echo INSTALL PATH     = "${INSTALLPATH}"
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
echo CLUSTERINSTALL   =  "${CLUSTERINSTALL}"
#echo "Number files in SEARCH PATH with EXTENSION:" $(ls -1 "${SEARCHPATH}"/*."${EXTENSION}" | wc -l)
truncate -s ${DEVSIZE} ${DEVICE}
yum install numactl libaio -y
cd /vagrant/scaleio/ScaleIO_1.32_RHEL6_Download

#if [ "${CLUSTERINSTALL}" == "True" ]; then
  rpm -Uv ${PACKAGENAME}-mdm-${VERSION}.${OS}.x86_64.rpm
  rpm -Uv ${PACKAGENAME}-sds-${VERSION}.${OS}.x86_64.rpm
  MDM_IP=${FIRSTMDMIP},${SECONDMDMIP} rpm -Uv ${PACKAGENAME}-sdc-${VERSION}.${OS}.x86_64.rpm

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
echo "Configuring the MDM as an SDS..."
scli --add_sds --mdm_ip ${FIRSTMDMIP} --sds_ip ${SECONDMDMIP} --device_path ${DEVICE} --sds_name ${SDSNAME} --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL}
echo "Configuing the TB as an SDS...."
scli --add_sds --mdm_ip ${FIRSTMDMIP} --sds_ip ${TBIP} --device_path ${DEVICE} --sds_name ${TBSDSNAME} --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL}
echo "Waiting for 30 seconds to make sure the SDSs are created"
sleep 30

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
