# flask nonsense that sets a RGB led on an arduino via a serial connection
Because, sometimes that's what you need. 

There was once a hardware hack night at a place of employment, and [@mdw123](https://github.com/mdw123) bought a bunch of ~~cheap~~ very inexpensive arduino nanos and some RGB Leds. Hacking was had. 

This project starts a python ( flask ) based webserver on your localhost, and connects to said arduino via serial ( should work on Mac or Linux ).

This project also contains an example `curl` based client to set the colors on the LED. 

## Prerequisite
# You'll want this loaded on your arduino
Load [this program](https://github.com/edyesed/RGBLed) on your arduino

# pipenv
This project uses pipenv to manage the server bit. If you don't already have that installed, you may need to read up on it. [This](https://realpython.com/pipenv-guide/) is a pretty good starting point.  

# TO RUN
## First, start the "server" component

```shell
sh $ pipenv shell 
(led-webserver) bash-3.2$ ./bin/server.py &
```

## Then, start the "client" component

```shell
sh $ pipenv shell 
(led-webserver) bash-3.2$ ./bin/client.sh &
```

    The client has to set three colors (RGB) before the arduino changes colors.


# requirements
All managed via `pipenv` these days. 
* python 2 ( very important that it's python 2 )
* flask
* pyserial
