#!/bin/bash

mysql -u root -h localhost -proot -e "SELECT TABLE_NAME, TABLE_ROWS FROM information_schema.tables WHERE table_schema = 'imdb'"
