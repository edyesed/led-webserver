#!/usr/bin/env python
#
import serial
import logging
import json
import glob
from time import sleep
from flask import Flask

from logging.handlers import RotatingFileHandler

app = Flask(__name__)
currcolor = None

serials = glob.glob('/dev/cu.usbserial*')
ser = serial.Serial(serials[0], timeout=5)
connected = False
currentcolor = None

@app.route("/")
def index():
  return "led server is go"

@app.route('/color/<color_set>', methods=['POST'])
def set_color(color_set=None):
  #return 'Color is %s' % color_set
  app.logger.debug("color is {0}".format(color_set))
  for i in range(1,3):
    errored = False
    app.logger.debug("range is {0}".format(i))
    cool_story_bro = color_set + "\n"
    try:
      ser.write(str(cool_story_bro))
    except Exception as e:
      errored = True
      print("ERR ser.write newline: %s" % (e))
    if errored is not True:
      break
    sleep(2)
  retinfo = {}
  retinfo['color'] = color_set
  return(json.dumps(retinfo))

if __name__ == "__main__":
  while not connected:
    serin = ser.read()
    connected = True
  # just go ahead and read anything that is already on the serial port ( which 
  # SHOULD be nothing, but it's serial. so there's that. 
  ser.readline(13)
  handler = RotatingFileHandler('server.log', maxBytes=10000, backupCount=1)
  handler.setLevel(logging.DEBUG)
  app.logger.addHandler(handler)
  app.run()
