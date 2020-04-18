#!/usr/bin/env python3

from influxdb import InfluxDBClient

from datetime import datetime
import uuid
import random
import time
import argparse


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

        parser.add_argument('--id', type=int, required=False, default=1,
                            help='id of one row in InfluxDB Database')

        parser.add_argument('--ip', required=False, default="localhost",
                            help='ip of InfluxDB Database')

        parser.add_argument('--port', type=int, required=False, default=8086,
                            help='port of InfluxDB Database')

        return parser.parse_args()


def testDroptInfluxDB(ip, port):

    dbname = 'test_influxdb_python'
    client = InfluxDBClient(ip, port, 'admin', 'admin', dbname)

    if (debug) :
        print("Create database: " + dbname)

    client.create_database(dbname)

    if (debug) :
        print("Drop database: " + dbname)

    client.drop_database(dbname)
    print("Time to drop empty InfluxDB database : " )

    if __name__ == '__main__':

        args=parse_args()
        start_time = time.time()
        testDroptInfluxDB(args.ip, args.port)
        end_time = time.time()
        print("Temps testDroptInfluxDB : ")
        print(end_time-start_time)
        print("in sec")
