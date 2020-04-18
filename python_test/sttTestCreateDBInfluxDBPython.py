#!/usr/bin/env python3

from influxdb import InfluxDBClient

from datetime import datetime
import uuid
import random
import time
import argparse

#measuring the execution time of small code snippits
import timeit

debug = False



def parse_args():
        """Parse the args."""
        parser = argparse.ArgumentParser(
            description='InfluxDB Pyhton Test')

        parser.add_argument('--ip', required=False, default="localhost",
                            help='points of InfluxDB ')

        parser.add_argument('--port', type=int, required=False, default=8086,
                            help='points of InfluxDB ')

        return parser.parse_args()

def testCreateInfluxDB(ip, port):

    dbname = 'test_influxdb_python'
    client = InfluxDBClient(ip, port, 'admin', 'admin', dbname)

    if (debug) :
        print("Create database: " + dbname)

    client.create_database(dbname)

if __name__ == '__main__':

    print("Time to create_database: ")
    args=parse_args()
    print(timeit.timeit(setup="from __main__ import testCreateInfluxDB",stmt="testCreateInfluxDB('{}','{}')".format(args.ip, args.port), number=100)/100)
    print("in sec")
