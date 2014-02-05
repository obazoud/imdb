#!/bin/bash
set -x

# apt-cacher
echo "Acquire::http { Proxy \"http://10.1.1.1:3142\"; };" > /etc/apt/apt.conf.d/01proxy
echo "deb http://http.debian.net/debian wheezy main" > /etc/apt/sources.list

aptitude update --assume-yes
aptitude dist-upgrade --assume-yes

aptitude_install() {
  /usr/bin/env DEBIAN_FRONTEND=noninteractive LC_ALL=C PATH=/bin:/sbin/:/usr/bin:/usr/sbin /usr/bin/aptitude -o Dpkg::Options::=--force-confold -o Dpkg::Options::=--force-confdef --assume-yes install "$@"
}

# common
aptitude_install "git" "tig" "vim" "tree" "curl" "wget" "zip" "tar" "zsh" "iotop"

# mysql
aptitude_install "mysql-server" "mysql-client" "libmysqlclient-dev"
mysqladmin -u root -h localhost password 'root'

cp /vagrant/conf/my.cnf /etc/mysql/my.cnf
/etc/init.d/mysql restart
mysql -u root -h localhost -proot -e "CREATE DATABASE imdb DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci"

# python
aptitude_install "python-dev" "python-mysqldb" "python-sqlobject" "python-setuptools" "libxml2-dev" "libxslt1-dev" "python-psyco"

# imdb setup
cd /usr/local/src
git clone git@github.com:obazoud/imdbpy.git
cd imdbpy
python ./setup.py --without-sqlalchemy install

# oh-my-zsh
cd
/usr/bin/curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
