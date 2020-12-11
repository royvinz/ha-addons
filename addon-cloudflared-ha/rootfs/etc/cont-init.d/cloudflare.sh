#!/usr/bin/with-contenv bashio
declare hostname
declare url
declare hostname2
declare url2
declare hostname3
declare ur3

hostname=$(bashio::config 'hostname')
url=$(bashio::config 'url')
hostname2=$(bashio::config 'hostname2')
url2=$(bashio::config 'url2')
hostname3=$(bashio::config 'hostname3')
url3=$(bashio::config 'url3')
 
echo -e "hostname: ${hostname}\nurl: ${url}" > /etc/cloudflared/1.yml

if bashio::config.has_value 'hostname2'; then
    echo -e "hostname: ${hostname2}\nurl: ${url2}" > /etc/cloudflared/2.yml
fi

if bashio::config.has_value 'hostname3'; then
    echo -e "hostname: ${hostname3}\nurl: ${url3}" > /etc/cloudflared/3.yml
fi