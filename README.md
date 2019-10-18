# flask nonsense that manages a arduino led
Yep. that's what it does. 

# You'll want this loaded on your arduino
(https://github.com/edyesed/RGBLed)[What to load on the arduino]

# TO RUN
`./bin/server.py`

once that's up and going

`./bin/client.sh`

    The client has to set three colors (RGB) before the arduino changes colors.


# requirements
* python 2 ( very important that it's python 2 )
* flask
* pyserial
