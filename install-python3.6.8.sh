#!/usr/bin/env bash

keyerrorlogo='
==================================================================
           --------- Python3.6一键脚本 ----------
		   
	已在centos6/centos7/debian7/debian8/ubuntu14上测试,
			    


		   
                                                 ----- caoyouming 
==================================================================';
echo "$keyerrorlogo";
echo

echo "按Enter开始安装,按Crtl+c取消........";
read;

if cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
    release="centos"	
	yum install gcc gcc-c++ make xz wget python-devel openssl-devel zlib-devel readline-devel openldap-devel -y
	elif  cat /etc/redhat-release | grep -Eqi "centos|red hat|redhat"; then
	release="centos"
	yum install openssl openssl-devel zlib-devel gcc -y
	elif  cat /etc/issue | grep -Eqi "ubuntu|debian"; then
    release="debian/ubuntu"
	apt-get update
	apt-get install -y zlib1g-dev 
	apt-get install -y gcc make
	apt-get install -y libssl-dev
	apt-get install -y openssl
	apt-get install -y libreadline-dev
fi
wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tar.xz
xz -d Python-3.6.8.tar.xz
tar -vxf Python-3.6.8.tar
cd Python-3.6.8
mkdir /usr/local/python3.6
./configure --prefix=/usr/local/python3.6 --enable-shared
make
make install
if [ $? -eq 0 ];then
     echo "Python3.6.8安装成功，开始配置Python3.6.8"
else
     echo "Python3.6.8安装失败，查看报错信息手动安装"
fi
rm /usr/bin/python
rm /usr/bin/pip
ln -s /usr/local/python3.6/bin/python3.6 /usr/bin/python
ln -s /usr/local/python3.6/bin/pip3 /usr/bin/pip
touch /etc/ld.so.conf.d/python3.conf
echo "/usr/local/python3.6/lib/" >> /etc/ld.so.conf.d/python3.conf
ldconfig
pip install pipenv

echo "python，pip，pipenv安装配置完成，开始你的Python之旅吧！！！"




