#!/usr/bin/env python3

from influxdb import InfluxDBClient
from datetime import datetime
import uuid
import random
import time

client = InfluxDBClient(host='localhost', port=8086)
client.create_database('test_influxdb_python3')

measurement_name = "stt"
number_of_points = 250000
data_end_time = int(time.time() * 1000) #milliseconds

source_tags = [ "FAKE0",
"FAKE1",
"FAKE2"]

type_tags = [ "Puissance",
"Vitesse",
"Denivele",
"Depence",
"Distance"]

# id_tags = []
# for i in range(100):
#     id_tags.append(str(uuid.uuid4()))

id_tags = []
for i in range(0,number_of_points,1):
    id_tags.append(i)

data = []
data.append("{measurement},source={source},type={type} id={id},value={value} {timestamp}"
            .format(measurement=measurement_name,
                    source=random.choice(source_tags),
                    type=random.choice(type_tags),
                    id=id_tags[i],
                    value=random.randint(0,41),
                    # y=round(random.random(),4),
                    # value=random.randint(0,50),
                    timestamp=data_end_time))
current_point_time = data_end_time
for i in range(number_of_points-1):
    current_point_time = current_point_time - random.randint(1,100)
    data.append("{measurement},source={source},type={type} id={id},value={value} {timestamp}"
                .format(measurement=measurement_name,
                        source=random.choice(source_tags),
                        type=random.choice(type_tags),
                        id=id_tags[i],
                        value=random.randint(0,41),
                        timestamp=current_point_time))

client.write_points(data, database='test_influxdb_python3', time_precision='ms', batch_size=10000, protocol='line')
