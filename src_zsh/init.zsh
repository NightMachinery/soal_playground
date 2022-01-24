#!/usr/bin/env zsh

if test -n "$gpu_p" ; then
    conda install -y --prefix /usr/local -c rapidsai -c nvidia -c conda-forge \
        python=3.8 rapids=21.12 cudatoolkit=11.0 dask-sql
fi
