# flask nonsense that manages a arduino led
Yep. that's what it does. 

# You'll want this loaded on your arduino
[https://github.com/edyesed/RGBLed](What to load on the arduino)

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
