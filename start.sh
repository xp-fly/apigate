#!/bin/bash
cur_dir=`pwd`
docker stop openresty
docker rm openresty
docker run -idt --name openresty -p 80:80 -v ${cur_dir}/conf.d:/etc/nginx/conf.d openresty/openresty
