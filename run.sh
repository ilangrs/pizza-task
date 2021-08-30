#/bin/bash

npm install

npm test

docker build -t ilangrs07/pizza-exp:latest .

docker-compose up --build -d

sleep 5

exit_code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8081)

echo $exit_code

if [ "$exit_code" == 200 ]; then
  echo "app is running"
  docker push ilangrs07/pizza-exp:latest
else
  echo "app not running"
fi

docker-compose down

cd pizza-exp-chart

helm dependency update

helm upgrade pizza-exp ../pizza-exp-chart
