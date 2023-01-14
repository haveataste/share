#! /bin/bash
docker pull myarpanet/megacmd:v2
docker run -it -v ~/share/:/root/share/ --name=tk myarpanet/megacmd:v2 /bin/bash
