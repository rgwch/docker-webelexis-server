# webelexis-server
A Webelexis server in a Docker image

usage: 

    sudo docker run -d -v /path/to/cfglocal.json:/home/webelexis/cfglocal.json -e VERSION=1.0.0 -p 2015:2015 rgwch/webelexis-server:latest
    
