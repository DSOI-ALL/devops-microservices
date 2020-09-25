#!/bin/bash
echo
echo Microservices Container Build
echo ==============================
echo
echo Building containers. Please wait...

buildnginx="docker build -f .docker/nginx.dockerfile -t nginx:latest ."

$buildnginx;

echo 'nginx build complete'

buildnode="docker build -f ./microservices/node/node.development.dockerfile -t node:latest ."

$buildnode;

echo 'node build complete'

pullmongo="docker pull mongo"

$pullmongo

echo 'mongo pull complete'

buildaspnetcoreapp="docker build -f ./microservices/aspnet_core/.docker/aspnetcore.development.dockerfile -t aspnetcoreapp:latest ."

$buildaspnetcoreapp

echo 'aspnetcoreapp build complete'

pullpostgres="docker pull postgres"

$pullpostgres

echo 'postgres pull complete'

pullcadvisor="docker pull google/cadvisor"

$pullcadvisor

echo 'cadvisor pull complete'

echo
echo Microservices Container Build Complete
echo ==============================
