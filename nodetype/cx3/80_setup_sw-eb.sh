#!/bin/bash

export PATH=/apps/archspec/0.1.3:${PATH}
export PYTHONPATH=/apps/archspec/0.1.3:${PYTHONPATH}

CPU_TYPE=$(cpudetect.py)
case ${CPU_TYPE} in
        x86_64/amd/zen2)
                ARCH="zen2"
                ;;

        x86_64/intel/skylake_avx512)
                ARCH="skylake"
                ;;
        *)
                ARCH="generic"
                ;;
esac
ln -s /rds/easybuild/${ARCH}/apps/ /sw-eb