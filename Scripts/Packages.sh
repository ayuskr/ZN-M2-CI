
#!/bin/bash

UPDATE_PACKAGE() {
    NAME=$1
    REPO=$2
    BRANCH=$3

    rm -rf package/$NAME
    rm -rf feeds/packages/net/mosdns
    rm -rf feeds/luci/applications/luci-app-mosdns
    git clone --depth=1 -b $BRANCH https://github.com/$REPO.git package/$NAME
}

cd wrt

echo "==== Custom Packages ===="

# Passwall全套（必须）
UPDATE_PACKAGE passwall-packages xiaorouji/openwrt-passwall-packages main
UPDATE_PACKAGE passwall xiaorouji/openwrt-passwall main

# mosdns（完整替换）
UPDATE_PACKAGE mosdns sbwml/luci-app-mosdns v5

# Lucky
UPDATE_PACKAGE lucky gdy666/luci-app-lucky main
