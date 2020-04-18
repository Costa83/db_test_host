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

def parse_args():
        """Parse the args."""
        parser = argparse.ArgumentParser(
            description='InfluxDB Pyhton Test')

        parser.add_argument('--ip', required=False, default="localhost",
                            help='points of InfluxDB ')

        parser.add_argument('--port', type=int, required=False, default=8086,
                            help='points of InfluxDB ')

        return parser.parse_args()


if __name__ == '__main__':

    debug = True
    args=parse_args()
    dbname="test_influxdb_python"

    client = InfluxDBClient(args.ip, args.port)
    start_time = time.time()
    client.drop_database(dbname)
    end_time = time.time()

    if debug:
        print("Temps testsWritePoints : ")
        print(end_time-start_time)
        print("in sec")
