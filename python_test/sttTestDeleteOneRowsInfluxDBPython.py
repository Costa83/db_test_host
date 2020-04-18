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

def delete_one_row(id, ip, port):

    start_time = time.time()

    dbname = 'test_influxdb_python'
    client = InfluxDBClient(ip, port, 'admin', 'admin', dbname)

    query_delete = "delete from stt where idtag='" + str(id) + "'"

    if debug :
        print("Create database: " + dbname)
        print("Querying data: " + query_delete)


    result = client.query(query_delete)
    print("Result: {0}".format(result))
    end_time = time.time()

    if debug:
        print("Temps testsDeleteOneRow : ")
        print(end_time-start_time)
        print("in sec")



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



if __name__ =="__main__":
    args=parse_args()
    delete_one_row(args.id, args.ip, args.port)
