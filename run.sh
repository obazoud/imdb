#!/bin/bash
set -x

/usr/local/bin/imdbpy2sql.py -o sqlobject -u mysql://root:root@localhost/imdb -d /vagrant/rawimdb --mysql-force-myisam
# 61s user 10755.56s system 46% cpu 13:21:20.06 total
