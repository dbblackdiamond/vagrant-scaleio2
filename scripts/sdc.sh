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

echo VOLNAME = "${VOLNAME}"
echo VOLSIZE = "${VOLSIZE}"
echo VERSION    = "${VERSION}"
echo OS    = "${OS}"
echo PACKAGENAME    = "${PACKAGENAME}"
echo FIRSTMDMIP = "${FIRSTMDMIP}"
echo SECONDMDMIP = "${SECONDMDMIP}"
echo SDCIP = "${SDCIP}"
echo PDOMAIN = "${PDOMAIN}"
echo POOL = "${POOL}"
echo SDCNAME = "${SDCNAME}"

yum install numactl libaio -y

# Downloading the latest files from EMC website
cd /vagrant
wget -nv ftp://ftp.emc.com/Downloads/ScaleIO/ScaleIO_RHEL6_Download.zip -O ScaleIO_RHEL6_Download.zip
unzip -o ScaleIO_RHEL6_Download.zip -d /vagrant/scaleio/

# Installing the SDS Package
cd /vagrant/scaleio/ScaleIO_1.32_RHEL6_Download
MDM_IP=${FIRSTMDMIP},${SECONDMDMIP} rpm -Uv ${PACKAGENAME}-sdc-${VERSION}.${OS}.x86_64.rpm

echo "Copying private key to vagrant user..."
cp /vagrant/vagrant.private /home/vagrant/.ssh/id_rsa
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
chmod 600 /home/vagrant/.ssh/id_rsa

echo "Copying private key to root user..."
mkdir /root/.ssh
cp /vagrant/vagrant.private /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

echo "Creating volume ${VOLNAME} of size ${VOLSIZE} and presenting it to SDC ${SDCNAME}..."
ssh -o StrictHostKeyChecking=no vagrant@${FIRSTMDMIP} "/vagrant/scripts/add_sdc.sh -vn ${VOLNAME} -z ${VOLSIZE} -f ${FIRSTMDMIP} -p ${PASSWORD} -i ${SDCIP} -pd ${PDOMAIN} -po ${POOL} -sd ${SDCNAME}"

if [[ -n $1 ]]; then
  echo "Last line of file specified as non-opt/last argument:"
  tail -1 $1
fi
