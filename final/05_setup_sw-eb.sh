#!/bin/bash

if hostname -s | grep -q login; then 
    echo "Do not link production Easybuild on login nodes"
    exit
fi

export PATH=/apps/archspec/0.1.3:${PATH}
export PYTHONPATH=/apps/archspec/0.1.3:${PYTHONPATH}

CPU_TYPE=$(cpudetect.py)
case ${CPU_TYPE} in
    x86_64/intel/haswell)
        ARCA="haswell"
        ;; 

    x86_64/intel/broadwell)
        ARCA="haswell"
        ;;

    x86_64/amd/zen2)
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
ln -s /rds/easybuild/${ARCH}/apps/ /sw-eb
