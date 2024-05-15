#!/bin/bash

./scripts/feeds update -a 2>&1 | tee ../update.log
if grep -E -i "^\s*error\s*:" ../update.log; then
    echo "cancelWorkflow=true" >>$GITHUB_ENV
else
    #一键命令(防止插件冲突，删除重复)
    rm -rf feeds/luci/applications/luci-app-mosdns
    rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
    rm -rf feeds/packages/utils/v2dat
    rm -rf feeds/packages/lang/golang
    git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
    #===========================================
    ./scripts/feeds install -a 2>&1 | tee ../install.log
    if grep -E -i "^\s*error\s*:" ../install.log; then
        echo "cancelWorkflow=true" >>$GITHUB_ENV
    else
        echo "cancelWorkflow=false" >>$GITHUB_ENV
    fi
fi
