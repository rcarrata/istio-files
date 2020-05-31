#!/bin/bash

url=$1
i=0
while :
do
  echo Request Number $i:
  ((i++))
  curl $url
  echo ""
  #sleep 1
done
