#!/bin/bash

SERVICES=$(docker service ls -q)

for SERVICE in $SERVICES; do
    docker service rm $SERVICE
done

echo "Все сервисы из стека $STACK_NAME были удалены."