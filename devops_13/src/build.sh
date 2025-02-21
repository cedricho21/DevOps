#!/bin/bash

cd services/session-service
docker build -t beyonder112/devops_7:session .
cd ../report-service
docker build -t beyonder112/devops_7:report .
cd ../gateway-service
docker build -t beyonder112/devops_7:gateway .
cd ../booking-service
docker build -t beyonder112/devops_7:booking .
cd ../hotel-service
docker build -t beyonder112/devops_7:hotel .
cd ../loyalty-service
docker build -t beyonder112/devops_7:loyalty .
cd ../payment-service
docker build -t beyonder112/devops_7:payment .

# docker push "beyonder112/devops_7:session"
# docker push "beyonder112/devops_7:report"
# docker push "beyonder112/devops_7:gateway"
# docker push "beyonder112/devops_7:booking"
# docker push "beyonder112/devops_7:hotel"
# docker push "beyonder112/devops_7:loyalty"
# docker push "beyonder112/devops_7:payment"

