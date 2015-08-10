#!/bin/bash
while [[ $# > 1 ]]
do
  key="$1"

  case $key in
    -vn|--volname)
    VOLNAME="$2"
    shift
    ;;
    -z|--volsize)
    VOLSIZE="$2"
    shift
    ;;
    -f|--firstmdmip)
    FIRSTMDMIP="$2"
    shift
    ;;
    -i|--ip)
    SDCIP="$2"
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
    -sd|--sdcname)
    SDCNAME="$2"
    shift
    ;;  

    *)
    # unknown option
    ;;
  esac
  shift
done
echo VOLNAME  = "${VOLNAME}"
echo VOLSIZE = "${VOLSIZE}"
echo FIRSTMDMIP    = "${FIRSTMDMIP}"
echo SDCIP = "${SDCIP}"
echo PASSWORD    = "${PASSWORD}"
echo PDOMAIN = "${PDOMAIN}"
echo POOL = "${POOL}"
echo SDCNAME = "${SDCNAME}"

echo "Login into the MDM..."
scli --mdm_ip ${FIRSTMDMIP} --login --username admin --password ${PASSWORD}
echo "Adding SDC to the cluster..."
scli --mdm_ip ${FIRSTMDMIP} --add_sdc --sdc_name ${SDCNAME} --sdc_ip ${SDCIP}
echo "Checking if ${VOLNAME} already exists..."
scli --mdm_ip ${FIRSTMDMIP} --query_volume --volume_name ${VOLNAME} &> /dev/null
if [ $? -eq 7 ]; then
	echo "Creating volume ${VOLNAME} with size ${VOLSIZE}..."
	scli --add_volume --mdm_ip ${FIRSTMDMIP} --size_gb ${VOLSIZE} --volume_name ${VOLNAME} --protection_domain_name ${PDOMAIN} --storage_pool_name ${POOL}
	echo "Mapping volume ${VOLNAME} to SDC ${SDCNAME}..."
	scli --map_volume_to_sdc --mdm_ip ${FIRSTMDMIP} --volume_name ${VOLNAME} --sdc_ip ${SDCIP} --allow_multi_map
else
	echo "Volume ${VOLNAME} already exists..."
	echo "Checking to see if ${VOLNAME} is already mapped to SDC ${SDCNAME}"
	MAPPEDSDC=`scli --mdm_ip ${FIRSTMDMIP} --query_volume --volume_name ${VOLNAME} 2> /dev/null | grep SDC |tail -1 |awk '{print $7}'`
	if [ ${MAPPEDSDC} != ${SDCNAME} ]; then
		echo "Volume ${VOLNAME} not mapped to SDC ${SDCNAME}, mapping it now..."
		scli --map_volume_to_sdc --mdm_ip ${FIRSTMDMIP} --volume_name ${VOLNAME} --sdc_ip ${SDCIP} --allow_multi_map
	else
		echo "Volume ${VOLNAME} already mapped to SDC ${SDCNAME}, nothing to do..."
	fi
	
fi

if [[ -n $1 ]]; then
  echo "Last line of file specified as non-opt/last argument:"
  tail -1 $1
fi
