#!/bin/bash

if [ -e feeds.conf.default ]
then
  git clone https://github.com/kenzok8/small-package package/small-package
  rm -rf package/small-package/uugamebooster
  rm -rf package/small-package/luci-app-UUGameAcc
  #rm -rf package/small-package/sing-box
  #rm -rf package/small-package/luci-app-passwall
  #rm -rf package/small-package/luci-app-passwall2
  #git clone https://github.com/xiaorouji/openwrt-passwall package/openwrt-passwall
  #git clone https://github.com/xiaorouji/openwrt-passwall/tree/luci package/luci-app-passwall
  #git clone https://github.com/xiaorouji/openwrt-passwall2 package/luci-app-passwall2
  #sed -i '$a  src-git small8 https://github.com/kenzok8/small-package' feeds.conf.default
  #sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
  #sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
fi  
