#!/bin/bash

gcc -o server fcgi.c -lfcgi
spawn-fcgi -p 8080 server

nginx -g 'daemon off;'
