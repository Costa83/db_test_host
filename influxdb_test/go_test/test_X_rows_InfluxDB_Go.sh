#!/bin/sh

echo "--- Test INFLUX DB in Go  ---"
echo "--- Clean directory: rm test_influx_db.db"
echo "--- ......"
echo " "
echo "--- Enter the number of rows to insert :      --- "
read -p "-> " r
middle=$(( r / 2 ))
#before last
blast=$(( r - 1 ))
div_ten=$(( r / 10))

echo "--->1/12 Creation de la base de donnee influxDB en Go  ---"
go run create_database_influxdb.go

echo "--->2/12 Lecture de la premiere ligne en BD            ---"
go run writepoints_database_influxdb.go --rows=$r

# echo "--->3/12 Lecture de la ligne $middle                   ---"
# sttTestReadRowInfluxDBGo -r $middle
#
# echo "--->4/12 Lecture de la ligne $blast                    ---"
# sttTestReadRowInfluxDBGo -r $blast

echo "--->5/12 Lecture de toutes les lignes                  ---"
go run read_database_influxdb.go


#Attention : suppression 1 ligne problématique
# echo "--->7/12 Suppression de la ligne numero $blast          ---"
# sttTestDeleteRowsInfluxDBGo -r $blast
#
# echo "--->8/12 Suppression de la ligne du milieu $middle       ---"
# sttTestDeleteRowsInfluxDBGo -r $middle
#
# echo "--->9/12 Lecture de la ligne du milieu $middle     ---"
# sttTestReadRowInfluxDBGo -r $middle

echo "--->10/12 Lecture de toutes les lignes              ---"
go run read_database_influxdb.go

echo "--->11/12 Suppression de toutes les lignes          ---"
go run delete_database_influxdb.go

echo "--->12/12 Lecture de toutes les lignes              ---"
go run read_database_influxdb.go
