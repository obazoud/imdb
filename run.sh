#!/bin/bash
set -x

/usr/local/bin/imdbpy2sql.py -o sqlobject -u mysql://root:root@localhost/imdb -d /vagrant/rawimdb --mysql-force-myisam
