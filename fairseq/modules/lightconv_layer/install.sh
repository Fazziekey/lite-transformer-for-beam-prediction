export PYTHONUSERBASE=/mnt/lustre/$USER/.local
export PYBIN=/mnt/lustre/$USER/.local/bin/
export PATH=$PYBIN:$PATH

export TORCH_EXTENSIONS_DIR=$DIR/${USER}/torch_extensions
export PATH=/mnt/lustre/share/gcc/gcc-5.3.0/bin/:$PATH
export PATH=/mnt/lustre/share/cuda-10.0/bin/:$PATH
# export CC=/mnt/lustre/share/gcc/gcc-5.3.0/
export CUDAHOME=/mnt/lustre/share/cuda-10.0/

spring.submit run --gpu -n 1 -p ToolChain --quotatype=spot --job-name=retinanet \
"python setup.py install --prefix=/mnt/lustre/maqianli/.local/"