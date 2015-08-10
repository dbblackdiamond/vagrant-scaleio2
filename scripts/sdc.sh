#!/bin/bash
while [[ $# > 1 ]]
do
  key="$1"

  case $key in
    -o|--os)
    OS="$2"
    shift
    ;;
    -vn|--volname)
    VOLNAME="$2"
    shift
    ;;
    -z|--volume_size)
    VOLSIZE="$2"
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
    -si|--sdcip)
    SDCIP="$2"
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
    -sd|--sdcname)
    SDCNAME="$2"
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

echo VOLNAME = "${VOLNAME}"
echo VOLSIZE = "${VOLSIZE}"
echo INSTALL PATH     = "${INSTALLPATH}"
echo VERSION    = "${VERSION}"
echo OS    = "${OS}"
echo PACKAGENAME    = "${PACKAGENAME}"
echo FIRSTMDMIP = "${FIRSTMDMIP}"
echo SECONDMDMIP = "${SECONDMDMIP}"
echo SDCIP = "${SDCIP}"
echo PDOMAIN = "${PDOMAIN}"
echo POOL = "${POOL}"
echo SDCNAME = "${SDCNAME}"

#echo "Number files in SEARCH PATH with EXTENSION:" $(ls -1 "${SEARCHPATH}"/*."${EXTENSION}" | wc -l)
yum install numactl libaio -y
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
