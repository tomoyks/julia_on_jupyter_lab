#!/bin/bash

##### install python #####
PYTHON_VERSION=3.7
apt-get install -y python${PYTHON_VERSION} python${PYTHON_VERSION}-dev python3-setuptools \
 && wget https://bootstrap.pypa.io/get-pip.py && python${PYTHON_VERSION} get-pip.py

pip${PYTHON_VERSION} install --upgrade pip setuptools
yes | pip${PYTHON_VERSION} install six==1.12.0 Cython contextlib2 matplotlib Image Pillow lxml \
                            jupyterlab==2.0.1 pandas numpy opencv-contrib-python \
                            autopep8 pylint scikit-learn albumentations pydotplus optuna \
                            plotly tensorflow==2.1.0 tensorboard ipywidgets seaborn

### export PYTHONPATH
PYTHONPATH=$PYTHONPATH:/work/ml
echo export PYTHONPATH=$PYTHONPATH >> ~/.bashrc
echo alias python="python3.7" >> /root/.bashrc
echo alias python3="python3.7" >> /root/.bashrc

##### install julia #####
JULIA_VERSION=1.3.1
mkdir /opt/julia-${JULIA_VERSION}
wget https://julialang-s3.julialang.org/bin/linux/x64/`echo ${JULIA_VERSION} | cut -d. -f 1,2`/julia-${JULIA_VERSION}-linux-x86_64.tar.gz -P /tmp
tar xzf /tmp/julia-${JULIA_VERSION}-linux-x86_64.tar.gz -C /opt/julia-${JULIA_VERSION} --strip-components=1
ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia
rm /tmp/julia-${JULIA_VERSION}-linux-x86_64.tar.gz

##### install julia packages #####
julia /tmp/julia_package_installs.jl

##### install node #####
curl -sL https://deb.nodesource.com/setup_12.x | bash - 
apt-get install -y nodejs

##### jupyter configuration #####
mkdir -p /work/notebook
jupyter notebook --generate-config
JUPYTER_CONFIG_PATH=/root/.jupyter/jupyter_notebook_config.py
echo "
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.port = 8080
c.NotebookApp.open_browser = False
c.NotebookApp.token = 'jupyter'
c.NotebookApp.notebook_dir = /work/notebook
" >> $JUPYTER_CONFIG_PATH

##### install jupyter lab extentions #####
jupyter labextension install @lckr/jupyterlab_variableinspector
jupyter labextension install @jupyterlab/toc
jupyter labextension install @krassowski/jupyterlab-lsp
