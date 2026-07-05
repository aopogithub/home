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

带rpd桌面的ubuntu容器:
danchitnis/xrdp:ubuntu-xfce
docker pull docker.1ms.run/danielguerra/ubuntu-xrdp:20.04
docker run -d --name desktop --hostname desktop --shm-size 1g -p 3389:3389 docke.1ms.run/danielguerra/ubuntu-xrdp:20.04

pve管理器-手机友好：
  docker run -d \
    --name pve-manager \
    --restart unless-stopped \
    -p 3400:3400 \
    -e PVE_HOST=https://192.168.101.10:8006 \
    -v /opt/pve-manager/data:/app/data \
    aopodockerhub/pve-mobile-manager:latest
  访问：
  http://服务器IP:3400
  如果你的 PVE 地址不是 https://192.168.101.10:8006，把 PVE_HOST 改成实际地址。
