import sys
import requests
import json
import time

infos = {}

while 1:
	print("-------Creation d'une nouvelle mesure----------")
	infos['nArduino'] = input("Numero Arduino : ")
	infos['nSensor'] = input("Numero Sensor : ")
	infos['value'] = input("Valeur : ")
	infos['measureTime'] = time.time()
	r=requests.post('http://localhost:6543/sensors', data=json.dumps(infos), headers={'content-type': 'application/json'})
	r.raise_for_status()
        print("-----Fin de creation--------\n")

#post la valeur sur l'API
