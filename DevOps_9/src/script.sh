#!/bin/bash

echo "Node Distribution of Services:"
echo "-------------------------------"

# Получаем список всех сервисов
services=$(docker service ls -q)

for service in $services; do
  #  echo "Service: $(docker service inspect --format '{{.Spec.Name}}' $service)"
    docker service ps $service --format "table {{.ID}}\t{{.Name}}\t{{.Node}}"
    echo ""
done
