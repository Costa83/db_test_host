#!/bin/sh

echo "--- Test INFLUX DB in Pyhton  ---"
echo "--- Clean directory: rm /var/lib/influxdb/test_influx_db.db"
echo "--- ......"
echo "--- Enter the number of rows to insert :             --- "
read -p "-> " r

middle=$(( r / 2 ))
blast=$(( r - 1 ))
div_ten=$(( r / 10))

echo "--- Enter the ip of client InfluxDB:                 --- "
read -p "-> " ip
echo "#########################################"
echo ""
echo "--- Enter the port of client InfluxDB:               --- "
read -p "-> " port
echo "#########################################"
echo ""
echo "--->0/10 Creation d'une base InfluxDB en Python      ---"
python2.7 sttTestCreateDBInfluxDBPython.py --ip=$ip --port=$port
echo "#########################################"
echo ""
echo "--->1/11 Suppression d'une base InfluxDB sans data   ---"
python2.7 sttTestDeleteAllRowsInfluxDBPython.py
echo "#########################################"
echo ""
echo "--->2/11 Insertion de  $r lignes en BD               ---"
python2.7 sttTestWritePointsInfluxDBPython.py --points=$r --ip=$ip --port=$port
echo "#########################################"
echo ""
echo "--->3/11 Lecture de  la ligne id  $middle  en BD     ---"
python2.7 sttTestReadOneRowsInfluxDBPython.py --id=$middle --ip=$ip --port=$port
echo "#########################################"
echo ""
echo "--->4/11 Lecture de  la ligne id  1  en BD           ---"
python2.7 sttTestReadOneRowsInfluxDBPython.py --id=1 --ip=$ip --port=$port
echo "#########################################"
echo ""
echo "--->5/11 Lecture de  la ligne id  $blast  en BD      ---"
python2.7 sttTestReadOneRowsInfluxDBPython.py --id=$blast --ip=$ip --port=$port
echo "#########################################"
echo ""
echo "--->6/11 Lecture de toutes les lignes  en BD         ---"
python2.7 sttTestReadAllRowsInfluxDBPython.py --ip=$ip --port=$port
echo "#########################################"
echo ""
echo "--->7/11 Suppression de  la ligne 1 $r en BD        ---"
python2.7 sttTestDeleteOneRowsInfluxDBPython.py --id=1 --ip=$ip --port=$port
echo "#########################################"
echo ""
echo "--->8/11 Suppression de  la ligne $middle en BD        ---"
python2.7 sttTestDeleteOneRowsInfluxDBPython.py --id=$middle --ip=$ip --port=$port
echo "#########################################"
echo ""
echo "--->9/11 Suppression de  la ligne $blast en BD        ---"
python2.7 sttTestDeleteOneRowsInfluxDBPython.py --id=$blast --ip=$ip --port=$port
echo "#########################################"
echo ""
echo "--->10/11 Suppression de  $r lignes en BD             ---"
python2.7 sttTestDropInfluxDBPython.py --ip=$ip --port=$port
echo "#########################################"
echo "--->11/11 Suppression de la BD                        ---"
python2.7 sttTestDeleteAllRowsInfluxDBPython.py
