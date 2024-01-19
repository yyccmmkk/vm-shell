# NAT 网卡模式联网设置

#上网设置
sed -i -r 's/^(ONBOOT=)(yes|no)/\1yes/g' /etc/sysconfig/network-scripts/ifcfg-enp0s3
sed -i -r 's/^(BOOTPROTO=)[a-z]+/\1dhcp/g' /etc/sysconfig/network-scripts/ifcfg-enp0s3
systemctl restart network
# 本地开发端口开放设置
firewall-cmd --add-port=22/tcp --permanent
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --add-port=4200/tcp --permanent
firewall-cmd --add-port=443/tcp --permanent
firewall-cmd --reload
