#!/bin/bash
while [[ $# > 1 ]]
do
  key="$1"

  case $key in
    -d|--device)
    DEVICE="$2"
    shift
    ;;
    -f|--firstmdmip)
    FIRSTMDMIP="$2"
    shift
    ;;
    -i|--ip)
    SDSIP="$2"
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
echo DEVICE  = "${DEVICE}"
echo DEVSIZE = "${DEVSIZE}"
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

echo "Configuring the SDS..."
scli --mdm_ip ${FIRSTMDMIP} --add_sds --sds_ip ${SDSIP} --device_path ${DEVICE} --sds_name ${SDSNAME} --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL}
echo "Waiting for 30 seconds to make sure the SDSs are created"
sleep 30

if [[ -n $1 ]]; then
  echo "Last line of file specified as non-opt/last argument:"
  tail -1 $1
fi
