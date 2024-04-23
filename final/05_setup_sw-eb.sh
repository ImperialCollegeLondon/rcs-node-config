#!/bin/bash

#if hostname -s | grep -q login; then 
#    echo "Do not link production Easybuild on login nodes"
#    exit
#fi

if [ -e /sw-eb ] ; then
        echo "Link already present $(ls -dl /sw-eb)"
fi


export PATH=/apps/archspec/0.1.3:${PATH}
export PYTHONPATH=/apps/archspec/0.1.3:${PYTHONPATH}

CPU_TYPE=$(cpudetect.py)
case ${CPU_TYPE} in
    x86_64/intel/haswell)
        ARCH="haswell"
        ;; 

    x86_64/intel/broadwell)
        # Not much difference between haswell so use that
        ARCH="haswell"
        ;;

    x86_64/amd/zen2)
        ARCH="zen2"
        ;;

    x86_64/amd/zen3)
        ARCH="zen2"
        ;;

    x86_64/intel/skylake_avx512)
        #Also have GPUs
        ARCH="skylake"
        ;;

    x86_64/intel/sandybridge)
        ARCH="generic"
        ;;

    x86_64/intel/ivybridge)
        ARCH="generic"
        ;;

    *)
        ARCH="generic"
        ;;
esac
#Remove any failing link and add new one
unlink /sw-eb
ln -s /rds/easybuild/${ARCH}/apps/ /sw-eb
