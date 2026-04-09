
#!/bin/bash

cd wrt

echo "==== Remove WiFi ===="

# 干掉WiFi（彻底）
sed -i '/ath11k/d' .config
sed -i '/wpad/d' .config
sed -i '/hostapd/d' .config

echo "==== System Optimize ===="

# 精简
sed -i '/ppp/d' .config
sed -i '/ipv6/d' .config

# 防止143（减少编译压力）
echo "CONFIG_DEVEL=y" >> .config
