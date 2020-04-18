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

debug = True


def parse_args():
        """Parse the args."""
        parser = argparse.ArgumentParser(
            description='InfluxDB Pyhton Test')

        parser.add_argument('--points', type=int, required=False, default=10,
                            help='points of InfluxDB ')

        parser.add_argument('--ip', required=False, default="localhost",
                            help='points of InfluxDB ')

        parser.add_argument('--port', type=int, required=False, default=8086,
                            help='points of InfluxDB ')

        return parser.parse_args()


if __name__ == '__main__':

    start_time = time.time()
    dbname = 'test_influxdb_python'
    args=parse_args()
    client = InfluxDBClient(args.ip, args.port, 'admin', 'admin', dbname)

    query_read = "select * from stt"
    if debug :
        print("Create database: " + dbname)
        print("Querying data: " + query_read)

    result = client.query(query_read)
    print("Result: {0}".format(result))
    end_time = time.time()

    if debug:
        print("Temps testsReadAllRows : ")
        print(end_time-start_time)
        print("in sec")
