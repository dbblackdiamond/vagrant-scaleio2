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

echo "CONFIGFILE = ${CONFIGFILE}"
source ${CONFIGFILE}

echo DEVICE  = "${DEVICE}"
echo FIRSTMDMIP    = "${FIRSTMDMIP}"
echo SDSIP = "${SDSIP}"
echo PASSWORD    = "${PASSWORD}"
echo PDOMAIN = "${PDOMAIN}"
echo POOL = "${POOL}"
echo SDSNAME = "${SDSNAME}"

echo "Login into the MDM..."
scli --mdm_ip ${FIRSTMDMIP} --login --username admin --password ${PASSWORD}
echo "Checking to see if Protection Domain ${PDOMAIN} already exists..."
scli --mdm_ip ${FIRSTMDMIP} --query_protection_domain --protection_domain_name ${PDOMAIN} &> /dev/null
if [ $? -eq  7 ]; then
	echo "Protection Domain ${PDOMAIN} doesn't exist, creating it..."
	scli --mdm_ip ${FIRSTMDMIP} --add_protection_domain --protection_domain_name ${PDOMAIN}
fi	
echo "Checking to see if Storage Pool ${POOL} already exists in Protection Domain ${PDOMAIN}..."
scli --mdm_ip ${FIRSTMDMIP} --query_storage_pool --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL} &> /dev/null
if [ $? -eq 7 ]; then
	echo "Storage Pool ${POOL} doesn't exist, creating it..."
	scli --mdm_ip ${FIRSTMDMIP} --add_storage_pool --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL}
fi

echo "Trying to configure the SDS..."
scli --add_sds --mdm_ip ${FIRSTMDMIP} --sds_ip ${SDSIP} --device_path ${DEVICE} --sds_name ${SDSNAME} --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL}
if [ $? -eq 7 ]; then
    sleep 30
    echo "Retrying..."
    scli --add_sds --mdm_ip ${FIRSTMDMIP} --sds_ip ${SDSIP} --device_path ${DEVICE} --sds_name ${SDSNAME} --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL}
    if [ $? -eq 7 ]; then
        sleep 30
        echo "Trying one last time..."
        scli --add_sds --mdm_ip ${FIRSTMDMIP} --sds_ip ${SDSIP} --device_path ${DEVICE} --sds_name ${SDSNAME} --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL}
        if [ $? -eq 7 ]; then
            echo "Failed to configure an SDS, exiting..."
            exit 0
        fi
    fi
fi
echo "SDS successfully configured..."

if [[ -n $1 ]]; then
  echo "Last line of file specified as non-opt/last argument:"
  tail -1 $1
fi
