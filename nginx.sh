#!/bin/bash
scp 201.1.1.254:/root/lnmp_soft-4月3号.tar.gz /root/ || scp 201.1.2.254:/root/lnmp_soft-4月3号.tar.gz /root/
cd 
tar xf lnmp_soft-4月3号.tar.gz
cd lnmp_soft-4月3号/
tar xf nginx-1.12.2.tar.gz
cd nginx-1.12.2
./configure --prefix=/usr/local/nginx --user=nginx --group=nginx --with-http_ssl_module --with-stream --with-http_stub_status_module
make && make install
ln -s /usr/local/nginx/sbin/nginx /sbin/
useradd -s /sbin/nologin nginx
passwd -d nginx
systemctl stop httpd
systemctl disable httpd
nginx

