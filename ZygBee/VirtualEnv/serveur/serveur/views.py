""" Cornice services.
"""
from pymongo import MongoClient
from cornice import Service
import json

Service.cors_origins = ('*',)
#hello = Service(name='hello', path='/', description="Simplest app")
sensorsService = Service(name='sensorsService', path='/sensors', description="Sensors Service")

client = MongoClient()
db = client.roki_rakat
sensorsCollection = db.sensors

@sensorsService.get()
def get_info(request):
    #"""Returns Hello in JSON."""
    #global VALUES
    #return [['VAL', VALUES['value']]]
    global sensorsCollection

    arduinosNode = []

    nArduinos = sensorsCollection.distinct('nArduino')
    for arduino_id in nArduinos:
        nSensors = sensorsCollection.find({'nArduino' : arduino_id}).distinct('nSensor')
	sensorsNode = []
        for sensor_id in nSensors : 
	    #for sensor in sensorsCollection.find({'$and' :[ {'nArduino' : arduino_id}, {'nSensor' : sensor_id} ] }).sort( 'measureTime', -1).limit(1):
	    #dataSensor =  { "value" : sensor['value'], "measureTime" : sensor['measureTime'] }
	    sensor = sensorsCollection.find({'$and' :[ {'nArduino' : arduino_id}, {'nSensor' : sensor_id} ] }).sort( 'measureTime', -1).limit(1)[0]
	    sensorsNode.append({ "sensorID" : sensor_id, "value" : sensor['value'], "measureTime" : sensor['measureTime'] })
        arduinosNode.append({ "arduinoID" : arduino_id, "sensors" : sensorsNode})
        print arduinosNode 

    return json.loads(json.loads(json.dumps(json.dumps({"arduinos" : arduinosNode}))))

    

@sensorsService.post()
def post_info(request):
    #global VALUES
    #VALUES = json.loads(request.body)
    #return {'msg': 'Merci'}
    global sensorsCollection
    values = json.loads(request.body)
    sensorsCollection.insert(values)

