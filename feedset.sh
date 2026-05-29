#!/bin/bash

if [ -e feeds.conf.default ]
then
  #sed -i '$a  src-git small8 https://github.com/kenzok8/small-package' feeds.conf.default
  #sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
  #sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
  sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
  sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
  #echo ceshi
fi  
