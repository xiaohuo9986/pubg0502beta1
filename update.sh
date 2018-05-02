#!/bin/bash
echo "欢迎使用一键搭建"
echo "即将搭建的是单兵作战同步卫星v5.2版本"
echo "准备开始安装"
read -p "回车后开始安装"
echo "请输入你的内网ip" 
read -p "内网ip： " ip
cp /root/pubg0502/restart.sh /root/restart.sh
chmod +x restart.sh
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log

echo "sstap搭建成，请记住连接信息(建议截图保存下来)"
read -p "记住了吗？任意键继续" 

curl https://raw.githubusercontent.com/creationix/nvm/v0.13.1/install.sh | bash
source ~/.bash_profile
nvm install v9.8.0
nvm alias default v9.8.0
yum -y install gcc-c++
yum -y install flex
yum -y install bison
wget http://www.tcpdump.org/release/libpcap-1.8.1.tar.gz
tar -zxvf libpcap-1.8.1.tar.gz
cd libpcap-1.8.1
./configure
make
make install

git clone https://github.com/xiaohuo9986/pubg0502.git
cd pubg0502/
npm i
npm i -g pino
npm install -g forever
forever start index.js sniff eth0 $ip | pino

echo "单兵作战同步卫星v4.30"
echo "注意有什么问题请联系Q23589979，并反馈消息"
echo "最后非常感谢各位的大力支持"
