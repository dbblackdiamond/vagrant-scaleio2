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
    -c|--clusterinstall)
    CLUSTERINSTALL="$2"
    shift
    ;;
    *)
    # unknown option
    ;;
  esac
  shift
done
echo INSTALL PATH     = "${INSTALLPATH}"
echo VERSION    = "${VERSION}"
echo OS    = "${OS}"
echo PACKAGENAME    = "${PACKAGENAME}"
echo FIRSTMDMIP    = "${FIRSTMDMIP}"
echo SECONDMDMIP    = "${SECONDMDMIP}"

yum install numactl libaio wget -y
cd /vagrant
wget -nv ftp://ftp.emc.com/Downloads/ScaleIO/ScaleIO_RHEL6_Download.zip -O ScaleIO_RHEL6_Download.zip
unzip -o ScaleIO_RHEL6_Download.zip -d /vagrant/scaleio/
cd /vagrant/scaleio/ScaleIO_1.32_RHEL6_Download

MDM_IP=${FIRSTMDMIP},${SECONDMDMIP} rpm -Uv ${PACKAGENAME}-tb-${VERSION}.${OS}.x86_64.rpm
MDM_IP=${FIRSTMDMIP},${SECONDMDMIP} rpm -Uv ${PACKAGENAME}-sds-${VERSION}.${OS}.x86_64.rpm
MDM_IP=${FIRSTMDMIP},${SECONDMDMIP} rpm -Uv ${PACKAGENAME}-sdc-${VERSION}.${OS}.x86_64.rpm

echo "Copying private key..."
cp /vagrant/vagrant.private /home/vagrant/.ssh/id_rsa
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
chmod 600 /home/vagrant/.ssh/id_rsa

if [[ -n $1 ]]; then
  echo "Last line of file specified as non-opt/last argument:"
  tail -1 $1
fi
