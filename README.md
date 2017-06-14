# Build Pageflow inside a Docker Container #

This Repo is based on the great Open Source Framework Pageflow, which you can find here: [https://github.com/codevise/pageflow](https://github.com/codevise/pageflow)

## 1. Get Pageflow running in 4 Steps ##

```#!terminal
$ git clone https://github.com/ElasticBrains/docker-pageflow.git
$ cd docker-pageflow
$ docker build -t pf:1.0 .
$ docker run --rm -it -p 3000:3000 pf:1.0

```

In the `docker run` command pageflow will be installed, this could take a while. Wait until you see the RubyOnRails output in your terminal. Which should look something like this:

```
=> Booting WEBrick
=> Rails 4.2.8 application starting in development on http://0.0.0.0:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
[2017-06-14 14:15:42] INFO  WEBrick 1.3.1
[2017-06-14 14:15:42] INFO  ruby 2.3.4 (2017-03-30) [x86_64-linux]
[2017-06-14 14:15:42] INFO  WEBrick::HTTPServer#start: pid=24 port=3000
```

Then you should be able to call http://localhost:3000 in your web browser.

![](https://media.giphy.com/media/mCxUZJN8i2wrC/giphy.gif)

The default User from pageflows db:seed is

```
     email:     admin@example.com
     password:  !Pass123
```

