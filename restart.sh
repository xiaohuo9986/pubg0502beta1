cd /root/libpcap-1.8.1/pubg0502/
read -p "请输入内网ip： " ip
forever start index.js sniff eth0 $ip | pino
echo "启动完成"
