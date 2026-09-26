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

release=$(cat ../OpenWrtSet.json | jq -r .build.release)
arch=$(cat ../OpenWrtSet.json | jq -r .build.arch)

if [[ "$release" =~ ^[0-9]{2}\.[0-9]{2}$ ]]; then
    version="${release%%.*}"

    if (( version > 24 )); then
        apk 第三方源
        mkdir -p files/etc/apk/repositories.d
        
        touch files/etc/apk/repositories.d/customfeeds.list
        
        for feed in passwall_luci passwall_packages passwall2; do
          echo "https://master.dl.sourceforge.net/project/openwrt-passwall-build/releases/packages-$release/$arch/$feed/packages.adb" >> files/etc/apk/repositories.d/customfeeds.list
        done        
        
        cat files/etc/apk/repositories.d/customfeeds.list
        
        # apk 公钥
        mkdir -p files/etc/apk/keys
        
        wget -O files/etc/apk/keys/openwrt-passwall-build.pem \
            https://master.dl.sourceforge.net/project/openwrt-passwall-build/apk.pub
        
        cat files/etc/apk/keys/openwrt-passwall-build.pem
    else
        # OPKG 第三方源
        mkdir -p files/etc/opkg

        touch files/etc/opkg/customfeeds.conf
        
        for feed in passwall_luci passwall_packages passwall2; do
          echo "src/gz $feed https://master.dl.sourceforge.net/project/openwrt-passwall-build/releases/packages-$release/$arch/$feed" >> files/etc/opkg/customfeeds.conf
        done

        cat files/etc/opkg/customfeeds.conf
        
        # OPKG 公钥
        mkdir -p files/etc/opkg/keys
        
        wget -O files/etc/opkg/keys/0abda65a492b4887 \
            https://master.dl.sourceforge.net/project/openwrt-passwall-build/ipk.pub

       cat files/etc/opkg/keys/0abda65a492b4887     
    fi
fi

echo "cancelWorkflow=true" >>$GITHUB_ENV
