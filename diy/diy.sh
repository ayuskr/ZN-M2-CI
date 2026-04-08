#!/bin/bash

# 替换软件源（加速）
sed -i 's|downloads.immortalwrt.org|mirrors.pku.edu.cn/immortalwrt|g' feeds.conf.default

# 更新 feeds
./scripts/feeds update -a
./scripts/feeds install -a

# 精简
rm -rf feeds/luci/applications/luci-app-wechatpush

# 修复权限
chmod -R 755 .