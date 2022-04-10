
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

spring.submit run -r --gpu -n 8 -p ToolChain --quotatype=auto \
    --job-name=liteTransformer \
    "python train.py data/DeepMIMO/train_model1.csv \
        --configs ./configs/deepMIMO/embed496.yml"

# "python -m torch.distributed.launch \
#         --nproc_per_node=8 \
#         --nnodes=1 --node_rank=0 \
#         --master_addr=host1 --master_port=8080 \
#         train.py ./configs/wmt14.en-fr/data/wmt14_en_fr \
#         --configs ./configs/wmt14.en-fr/attention/multibranch_v2/embed496.yml \
#         --distributed-no-spawn  --update-freq 8"