#!/bin/bash

if [[ $# != 1 ]] || [[  $1 =~ ^[0-9]+$ ]];
then
        echo "Incorrect input"
else
   echo $1
fi   
