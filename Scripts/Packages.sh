#!/bin/bash

UPDATE_PACKAGE() {
    NAME=$1
    REPO=$2
    BRANCH=$3

    rm -rf package/$NAME
    git clone --depth=1 -b $BRANCH https://github.com/$REPO.git package/$NAME
}

cd wrt

echo "==== Stable Packages ===="

# =========================
# 🔥 1. 先删冲突包（关键）
# =========================

rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/applications/luci-app-mosdns

# （可选）避免奇怪冲突
rm -rf feeds/packages/net/v2ray-core
rm -rf feeds/packages/net/xray-core

# =========================
# 🔥 2. Passwall（完整依赖）
# =========================

UPDATE_PACKAGE passwall-packages xiaorouji/openwrt-passwall-packages main
UPDATE_PACKAGE passwall xiaorouji/openwrt-passwall main

# =========================
# 🔥 3. MosDNS（唯一版本）
# =========================

UPDATE_PACKAGE mosdns sbwml/luci-app-mosdns v5

# =========================
# 🔥 4. Lucky
# =========================

UPDATE_PACKAGE lucky gdy666/luci-app-lucky main
