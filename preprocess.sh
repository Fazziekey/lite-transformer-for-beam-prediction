#!/bin/bash

set -x
T=`date +%m%d%H%M`
# ROOT=../../
DIR=/mnt/lustre/
ROOT=$DIR/${USER}/mb_det
export PODROOT=$ROOT
cfg=$ROOT/configs/mb_det/MB4.yaml
export PYTHONPATH=$ROOT:$PYTHONPATH

export PATH=/mnt/lustre/share/spring:$PATH
export PYTHONUSERBASE=/mnt/lustre/$USER/.local
export PYBIN=/mnt/lustre/$USER/.local/bin/
export PATH=$PYBIN:$PATH

export TORCH_EXTENSIONS_DIR=$DIR/${USER}/torch_extensions
export PATH=/mnt/lustre/share/gcc/gcc-5.3.0/bin/:$PATH
export PATH=/mnt/lustre/share/cuda-10.0/bin/:$PATH

TEXT=./configs/wmt14.en-fr/data/wmt14_en_friwslt14.tokenized.de-en

spring.submit run -n 1\
    --job-name=preprocess \
"python preprocess.py --source-lang de --target-lang en \
    --trainpref $TEXT/train --validpref $TEXT/valid --testpref $TEXT/test \
    --destdir data-bin/iwslt14.tokenized.de-en"

