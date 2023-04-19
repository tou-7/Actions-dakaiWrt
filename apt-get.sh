          ( sudo -E apt-get -qq update
          sudo -E apt-get -qq install build-essential clang flex g++ gawk gcc-multilib gettext \
          git libncurses5-dev libssl-dev python3-distutils rsync unzip zlib1g-dev swig libpython3-dev python3-pip aria2 jq subversion qemu-utils ccache rename libelf-dev libfuse-dev
          sudo -E apt-get -qq purge azure-cli ghc* zulu* hhvm llvm* firefox powershell openjdk* dotnet* google* mysql* php* android*
          sudo rm -rf /etc/apt/sources.list.d/* /usr/share/dotnet /usr/local/lib/android /opt/ghc
          sudo -E apt-get -qq autoremove --purge
          sudo -E apt-get -qq clean ) &
          sudo timedatectl set-timezone "Asia/Shanghai"
