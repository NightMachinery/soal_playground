#!/usr/bin/env bash
# @UbuntuOnly
##
sudo apt-get update
sudo apt-get install -y zsh emacs vim unzip aria2 ncdu htop time
##
export gpu_p=''
if nvidia-smi >&/dev/null ; then
    gpu_p=y
fi

export drive_dir='/content/drive/MyDrive'
export save_dir="${drive_dir}/soalpy"
export code_dir='/content/code'
export soal_dir="${code_dir}/soal_playground"
export bench_dir="${save_dir}/benchmarks"

export conda_usrlocal_p=''
if test -n "${conda_usrlocal_p}" ; then
    export conda_path="/usr/local"
else
    export conda_path="$HOME/miniconda3"
fi

for var in gpu_p \
    drive_dir \
    save_dir \
    code_dir \
    soal_dir \
    bench_dir \
    conda_usrlocal_p \
    conda_path \
    ; do
    typeset -p "$var" >> ~/.zshenv
done
##
wget https://github.com/sharkdp/hyperfine/releases/download/v1.12.0/hyperfine_1.12.0_amd64.deb
sudo dpkg -i hyperfine_1.12.0_amd64.deb
##
if test -z "$no_conda" && test -n "$gpu_p" ; then
    if ! ( test -e "${conda_path}" && test -z "${conda_usrlocal_p}" ) ; then
        wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

        bash ./Miniconda3-latest-*.sh -f -b -p "${conda_path}"
        #: -f           no error if install prefix already exists
    fi

    echo 'export PATH="'${conda_path}/bin':$PATH"' >> ~/.zshenv
fi
##
#: This silences the large allocation warnings in Python.
echo 'export TCMALLOC_LARGE_ALLOC_REPORT_THRESHOLD=21329330176' >> ~/.zshenv
##
nvtop-install () {
    sudo apt-get install -y cmake libncurses5-dev libncursesw5-dev git || return $?
    local d=~/code/misc
    mkdir -p "$d" || return $?
    cd "$d" || return $?
    git clone https://github.com/Syllo/nvtop.git || return $?
    mkdir -p nvtop/build && cd nvtop/build || return $?
    cmake .. || return $?
    make || return $?
    sudo make install || return $?
}
nvtop-install
##
