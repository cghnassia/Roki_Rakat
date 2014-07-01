import serial
import sys
import time

ser = serial.Serial(sys.argv[1], 9600)

if ser.isOpen():
	print("Starting configuration on ", ser.portstr)
else:
	print("FAIL: can't open serial on ", sys.argv[1])
	sys.exit(1)

while ser.inWaiting() > 0:
	ser.read()

ser.write("+++")
while ser.isOpen():
	if ser.inWaiting() >= 3:
		if ser.read() == "O" and ser.read() == "K" and ser.read() == "\r":	
			ser.write("ATID 1988\r\n")
			if ser.read() == "O" and ser.read() == "K" and ser.read() == "\r":	
				print("ATID OK")
			ser.write("ATDH 0\r\n")
			if ser.read() == "O" and ser.read() == "K" and ser.read() == "\r":	
				print("ATDH OK")
			if sys.argv[2] == "A1":
				ser.write("ATCE 1\r\n")
				if ser.read() == "O" and ser.read() == "K" and ser.read() == "\r":	
					print("ATCE OK")
				ser.write("ATMY A1\r\n")
				if ser.read() == "O" and ser.read() == "K" and ser.read() == "\r":	
					print("ATMY OK")
			elif sys.argv[2]  in ["B1", "B2", "B3"]:
				ser.write("ATCE 0\r\n")
				if ser.read() == "O" and ser.read() == "K" and ser.read() == "\r":	
					print("ATCE OK")
				ser.write("ATMY " + sys.argv[2] + "\r\n")
				if ser.read() == "O" and ser.read() == "K" and ser.read() == "\r":	
					print("ATMY OK")
				ser.write("ATDL A1\r\n")
				if ser.read() == "O" and ser.read() == "K" and ser.read() == "\r":	
					print("ATDL OK")
			else:		
				print("FAIL: ", sys.argv[2], " is not a valid option")
				sys.exit(1)
			ser.write("ATWR\r\n")	
			if ser.read() == "O" and ser.read() == "K" and ser.read() == "\r":	
				print("ATWR OK")
			print "Configuration for ", sys.argv[2] ," has finished with success"
			ser.close()
		else:
			time.sleep(2)
			ser.write("+++")

exit(0);
