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
    -si|--sdsip)
    SDSIP="$2"
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
    -p|--password)
    PASSWORD="$2"
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
echo VERSION    = "${VERSION}"
echo OS    = "${OS}"
echo PACKAGENAME    = "${PACKAGENAME}"
echo FIRSTMDMIP = "${FIRSTMDMIP}"
echo SECONDMDMIP = "${SECONDMDMIP}"
echo SDSIP = "${SDSIP}"
echo PDOMAIN = "${PDOMAIN}"
echo POOL = "${POOL}"
echo SDSNAME = "${SDSNAME}"

# Creating the file to be added to the Pool. The file is thin provisioned 
truncate -s ${DEVSIZE} ${DEVICE}
yum install numactl libaio -y

# Installing the SDS package
cd /vagrant/scaleio/ScaleIO_1.32_RHEL6_Download
MDM_IP=${FIRSTMDMIP},${SECONDMDMIP} rpm -Uv ${PACKAGENAME}-sds-${VERSION}.${OS}.x86_64.rpm

echo "Copying private key to vagrant user..."
cp /vagrant/vagrant.private /home/vagrant/.ssh/id_rsa
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
chmod 600 /home/vagrant/.ssh/id_rsa

echo "Copying private key to root user..."
mkdir /root/.ssh
cp /vagrant/vagrant.private /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

echo "Adding the SDS to the cluster..."
ssh -o StrictHostKeyChecking=no vagrant@${FIRSTMDMIP} "/vagrant/scripts/add_sds.sh -d ${DEVICE} -f ${FIRSTMDMIP} -p ${PASSWORD} -i ${SDSIP} -pd ${PDOMAIN} -po ${POOL} -sd ${SDSNAME}"

if [[ -n $1 ]]; then
  echo "Last line of file specified as non-opt/last argument:"
  tail -1 $1
fi
