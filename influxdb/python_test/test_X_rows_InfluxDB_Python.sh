#!/bin/sh

echo "--- Test INFLUX DB in Pyhton  ---"
echo "--- Clean directory: rm /var/lib/influxdb/test_influx_db.db"
echo "--- ......"
echo "--- Enter the number of rows to insert :      --- "

read -p "-> " r

middle=$(( r / 2 ))
blast=$(( r - 1 ))
div_ten=$(( r / 10))

echo "--->0/12 Create d'une base InfluxDB                ---"
sttTestCreateDBInfluxDBPython

echo "--->1/12 Suppression d'une base InfluxDB sans data ---"
sttTestDropEmptyInfluxDBPython

echo "--->2/12 Insertion de  $r lignes en BD             ---"
sttTestWritePointsInfluxDBPython --points $r

echo "--->3/12 Lecture de  la ligne id  $middle  en BD   ---"
sttTestReadOneRowsInfluxDBPython --id $middle

echo "--->4/12 Lecture de  la ligne id  1  en BD   ---"
sttTestReadOneRowsInfluxDBPython --id 1

echo "--->4/12 Lecture de  la ligne id  $blast  en BD   ---"
sttTestReadOneRowsInfluxDBPython --id $blast

echo "--->5/12 Lecture de toutes les lignes  en BD   ---"
sttTestReadAllRowsInfluxDBPython

echo "--->6/12 Suppression de  $r lignes en BD             ---"
sttTestDropInfluxDBPython


# echo "--->7/12 Suppression de la ligne numero $blast     ---"
# sttTestDeleteRowsInfluxDBPython -r $blast
