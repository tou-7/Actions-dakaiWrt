        sudo apt update
        sudo apt -qq -y --no-install-recommends install pv jq \
        ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
        bzip2 ccache clang cmake cpio curl device-tree-compiler ecj fastjar flex gawk gettext gcc-multilib \
        g++-multilib git gnutls-dev gperf haveged help2man intltool lib32gcc-s1 libc6-dev-i386 libelf-dev \
        libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses5-dev libncursesw5 \
        libncursesw5-dev libpython3-dev libreadline-dev libssl-dev libtool lld llvm lrzsz mkisofs \
        nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip python3-ply \
        python3-docutils python3-distutils python3-pyelftools qemu-utils re2c rsync scons squashfs-tools subversion swig \
        texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev libfuse-dev rename
        sudo rm -rf /usr/share/dotnet /usr/local/lib/android/sdk /opt/hostedtoolcache
        sudo -E apt-get -qq autoremove --purge
        sudo -E apt-get -qq clean
        sudo timedatectl set-timezone "Asia/Shanghai" 
