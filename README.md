＃home
Pwd@CentOS
wget --no-check-certificate -O AutoReinstall.sh https://git.io/AutoReinstall.sh && bash AutoReinstall.sh


bash <(curl -s -L https://git.io/v2ray.sh)


apt-get install -y xz-utils openssl gawk file wget screen && screen -S os

wget --no-check-certificate -O NewReinstall.sh https://cdn.jsdelivr.net/gh/fcurrk/reinstall@master/NewReinstall.sh && chmod a+x NewReinstall.sh && bash NewReinstall.sh

启用bbr拥塞算法：
modprobe tcp_bbr
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
