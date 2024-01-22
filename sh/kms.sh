#!/bin/bash
#仓库不可用直接复制
#git clone git@github.com:Wind4/vlmcsd.git
tar -xzvf vlmcsd.tar.gz 
cd vlmcsd
make

cp ./bin/vlmcsd  /usr/bin/
chmod 755 /usr/bin/vlmcsd

touch /var/run/vlmcsd.pid
chmod 755 /var/run/vlmcsd.pid
echo -e "[Unit]\nDescription=KMS Emulator\nAfter=network.target\n\n[Service]\nType=forking\nPIDFile=/var/run/vlmcsd.pid\nExecStart=/usr/bin/vlmcsd -p /var/run/vlmcsd.pid\nExecStop=/bin/kill -HUP $MAINPID\nPrivateTmp=true\n\n[Install]\nWantedBy=multi-user.target" > /lib/systemd/system/vlmcsd.service
systemctl daemon-reload
systemctl enable vlmcsd.service
systemctl start  vlmcsd.service
firewall-cmd --zone=public --add-port=1688/tcp --permanent
firewall-cmd --reload
rm kms.sh
