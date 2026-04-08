#!/bin/bash

# 替换源（加速）
sed -i 's|downloads.immortalwrt.org|mirrors.pku.edu.cn/immortalwrt|g' feeds.conf.default

# 更新
./scripts/feeds update -a
./scripts/feeds install -a

# 删除无用插件（减负）
rm -rf feeds/luci/applications/luci-app-wechatpush

# 权限修复
chmod -R 755 .
