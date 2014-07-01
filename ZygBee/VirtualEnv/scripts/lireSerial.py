import serial
import sys
import requests
import json
import time

ser = serial.Serial(sys.argv[1], 9600)

if ser.isOpen():
	print("Listening on ", ser.portstr)
else:
	print("FAIL")
	sys.exit(1)

while ser.isOpen():
	if ser.inWaiting() > 3:
		value = ord(ser.read())
		if value == 0x7E:
			infos = {}
			infos['nArduino'] = ord(ser.read())
			infos['nSensor'] = ord(ser.read())
			infos['value'] = ord(ser.read())
			infos['measureTime'] = time.time()
			print "Receive data for Arduino " + str(infos['nArduino'])
			r=requests.post('http://localhost:6543/sensors', data=json.dumps(infos), headers={'content-type': 'application/json'})
			r.raise_for_status()

#post la valeur sur l'API
