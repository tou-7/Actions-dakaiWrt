#!/bin/bash
#===============================================
#1. Modify default IP
#sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

#2. Custom settings
#sed -i 's?zstd$?zstd ucl upx\n$(curdir)/upx/compile := $(curdir)/ucl/compile?g' tools/Makefile
#sed -i 's/$(TARGET_DIR)) install/$(TARGET_DIR)) install --force-overwrite/' package/Makefile
#sed -i 's/root:.*/root:$1$tTPCBw1t$ldzfp37h5lSpO9VXk4uUE\/:18336:0:99999:7:::/g' package/base-files/files/etc/shadow
#echo "makeJ1Model=true" >> $GITHUB_ENV
#===============================================

release=25.12
arch=aarch64_cortex-a53

# # OPKG 第三方源
# mkdir -p package/base-files/files/etc/opkg

# cat > package/base-files/files/etc/opkg/customfeeds.conf <<EOF
# src/gz passwall_luci https://master.dl.sourceforge.net/project/openwrt-passwall-build/releases/packages-$release/$arch/passwall_luci
# src/gz passwall_packages https://master.dl.sourceforge.net/project/openwrt-passwall-build/releases/packages-$release/$arch/passwall_packages
# src/gz passwall2 https://master.dl.sourceforge.net/project/openwrt-passwall-build/releases/packages-$release/$arch/passwall2
# EOF

# # OPKG 公钥
# mkdir -p package/base-files/files/etc/opkg/keys

# wget -O package/base-files/files/etc/opkg/keys/0abda65a492b4887 \
#     https://master.dl.sourceforge.net/project/openwrt-passwall-build/ipk.pub

#===============================================
# apk 第三方源
mkdir -p package/base-files/files/etc/apk/repositories.d

cat > package/base-files/files/etc/apk/repositories.d/customfeeds.list <<EOF
https://master.dl.sourceforge.net/project/openwrt-passwall-build/releases/packages-$release/$arch/passwall_luci/packages.adb
https://master.dl.sourceforge.net/project/openwrt-passwall-build/releases/packages-$release/$arch/passwall_packages/packages.adb
https://master.dl.sourceforge.net/project/openwrt-passwall-build/releases/packages-$release/$arch/passwall2/packages.adb
EOF

cat package/base-files/files/etc/apk/repositories.d/customfeeds.list

# apk 公钥
mkdir -p package/base-files/files/etc/apk/keys

wget -O package/base-files/files/etc/apk/keys/openwrt-passwall-build.pem \
    https://master.dl.sourceforge.net/project/openwrt-passwall-build/apk.pub

cat package/base-files/files/etc/apk/keys/openwrt-passwall-build.pem
    
