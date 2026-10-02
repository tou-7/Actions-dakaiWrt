        # sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
        wget https://apt.llvm.org/llvm.sh
        chmod +x llvm.sh && sudo ./llvm.sh all
        sudo -E apt-get -qq update
        sudo -E apt-get -qq install dwarves npm bc python3 xz-utils tar
        sudo -E apt-get -qq install build-essential clang flex bison g++ gawk \
        gcc-multilib g++-multilib gettext git libncurses5-dev libssl-dev \
        python3-setuptools rsync swig unzip zlib1g-dev file wget \
        llvm python3-pyelftools libpython3-dev aria2 jq qemu-utils ccache rename \
        libelf-dev device-tree-compiler libgmp3-dev libmpc-dev libfuse-dev
        npm install -g pnpm
        sudo -E apt-get -qq autoremove --purge
        sudo -E apt-get -qq clean
        sudo timedatectl set-timezone "Asia/Shanghai"
