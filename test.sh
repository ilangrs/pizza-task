#/bin/bash

curl -I -w "%{http_code}" http://localhost:8081
