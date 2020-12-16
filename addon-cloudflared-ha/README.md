# CATH - Cloudflared Argo Tunnel Hub


## INTRODUCTION

This is a Cloudflared Argo Tunnel working with ARM64 Raspeberry PI 4 (64bits) and ingress routes in config file.


## PREREQUISITE

1) You'll need to sign up for Argo with Cloudflare directly and generate an SSL certificate ('cert.pem' file) at the following url: https://www.cloudflare.com/a/warp

2) From a separate machine with cloudflared installed, run the command: `cloudflared tunnel create <tunnel name>` --\> it will generate a cloudflared crendentials-file ('xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx.json') that will will mount in the docker volume

3) Create a cloudflared configuration file that you will also mount in the docker volume. The configuration file format is (replace xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx.json below with the name of the file generated at step 2):

    ` \#--------------------------- `
    tunnel: \<tunnel-name\>
    credentials-file: /config/cloudflared/xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx.json
    ingress:
      - hostname: site1.mydomain.com
        service: http://192.168.1.1:80
      - hostname: homeassistant.mydomain.com
        service: http://homeassistant:8123  
      - hostname: site2.mydomain.com
        service: http://192.168.1.100:8080
      - service: http_status:404
    #----------------------------------------`


## CONFIGURATION

All the configuration files are located at: `/config/cloudflared/`
The configuration is based on 2 files:
- `config.yml` --\> the cloudflared configuration file
- `xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx.json` --\> the cloudflared credentials-file used to authenticate to Cloudflare

The `/config/cloudflared/` folder should be docker mounted.


Enyoy! :+1: