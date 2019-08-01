#!/usr/bin/env bash

keyerrorlogo='
==================================================================
           --------- Python2.7.8一键脚本 ----------
		   
	已在centos6/centos7/debian7/debian8/ubuntu14上测试,
			    


		   
                                                 ----- caoyouming 
==================================================================';
echo "$keyerrorlogo";
echo

echo "按Enter开始安装,按Crtl+c取消........";
read;

if cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
    release="centos"	
	yum install gcc gcc-c++ make xz wget python-devel openssl-devel zlib-devel readline-devel openldap-devel mysql-devel -y
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
wget https://www.python.org/ftp/python/2.7.8/Python-2.7.8.tar.xz
xz -d Python-2.7.8.tar.xz
tar -vxf Python-2.7.8.tar
cd Python-2.7.8
mkdir /usr/local/python2.7
./configure --enable-shared --prefix=/usr/local/python2.7 
make
make install
if [ $? -eq 0 ];then
     echo "Python2.7.8安装成功，开始配置Python2.7.8"
else
     echo "Python2.7.8安装失败，查看报错信息手动安装"
fi
rm /usr/bin/python
ln -s /usr/local/python2.7/bin/python2.7 /usr/bin/python

echo "python安装成功，配置并开始安装pip......"
cp /usr/local/python2.7/lib/libpython2.7.so.1.0 /usr/local/lib
cd /usr/local/lib
ln -s libpython2.7.so.1.0 libpython2.7.so
echo "/usr/local/lib" >> /etc/ld.so.conf
 /sbin/ldconfig

cd /project/soft/
wget https://pypi.python.org/packages/45/29/8814bf414e7cd1031e1a3c8a4169218376e284ea2553cc0822a6ea1c2d78/setuptools-36.6.0.zip#md5=74663b15117d9a2cc5295d76011e6fd1
unzip setuptools-36.6.0.zip 
cd setuptools-36.6.0
python setup.py install

cd /project/soft
wget https://pypi.python.org/packages/11/b6/abcb525026a4be042b486df43905d6893fb04f05aac21c32c638e939e447/pip-9.0.1.tar.gz#md5=35f01da33009719497f01a4ba69d63c9
tar -zxvf pip-9.0.1.tar.gz
cd pip-9.0.1
python setup.py install
rm /usr/bin/pip
ln -s /usr/local/python2.7/bin/pip /usr/bin/pip
rm /usr/bin/easy_install
ln -s /usr/local/python2.7/bin/easy_install /usr/bin/easy_install
echo "pip 安装成功"
pip  install virtualenv
ln -s /usr/local/python2.7/bin/virtualenv /usr/bin/virtualenv
cd /project/opt/
virtualenv python27env

echo "python2.6.8，pip，virtualenv安装配置完成，开始你的Python之旅吧！！！yum请将/usr/bin/yum中的代码头文件注释python改为python2.6"




