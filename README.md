# Build Pageflow inside a Docker Container #

## 1. Get Pageflow run in 4 Steps ##

```#!terminal
$ git clone https://github.com/ElasticBrains/docker-pageflow.git
$ cd docker-pageflow
$ docker build -t pf:1.0 .
$ docker run --rm -it -p 3000:3000 pf:1.0

```