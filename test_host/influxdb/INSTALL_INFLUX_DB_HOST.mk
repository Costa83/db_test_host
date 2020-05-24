INSTALL INFLUXDB ON UBUNTU HOST FROM SCRATCH :


On est sur une architecture client-serveur où ici le client et le serveur est situé sur le PC hote.

Outils : GRAFANA, InfluxDB


###############################################################################
## ETAPE 1: Installer GRAFANA :

Grafana is by far one of the most popular open source dashboard monitoring tools of 2019. 
Used by SpaceX, Bloomberg and Booking.com, Grafana is definitely a must-have for engineers wanting a robust and scalable dashboard monitoring solution.
It can be used to monitor a wide variety of different datasources : SQL databases (MySQL or PostgreSQL), NoSQL databases and time series databases (such as InfluxDB or TimescaleDB)

Depuis le site officiel :https://grafana.com/grafana/download 

Ubuntu and Debian(64 Bit)SHA256: 2f307d8ec8ef72aa2831efe1d1d82d5975a801276d6ebadebb9ab0e35a59bb86 

 
$ sudo apt-get install -y adduser libfontconfig1
$ wget https://dl.grafana.com/oss/release/grafana_6.7.2_amd64.deb
$ sudo dpkg -i grafana_6.7.2_amd64.deb



$ sudo systemctl daemon-reload
$ sudo systemctl start grafana-server
$ sudo systemctl status grafana-server

Configure the Grafana server to start at boot:
$ sudo systemctl enable grafana-server.service

Start the server with init.d
$ sudo service grafana-server start



https://grafana.com/docs/grafana/latest/guides/getting_started/
Log in for the first time
Open your web browser and go to http://localhost:3000/. 3000 is the default HTTP port that Grafana listens to if you haven’t configured a different port. 
    1. On the login page, type admin for the username and password. 
    2. Change your password.  « gucos83 » « gucos83 »

Tutoriel supplémentaire :
https://www.sugarbug.fr/atelier/maquettes/centreon_graphite_graphana/grafana/











###############################################################################

## ETAPE 2: Installer InfluxDB: Install InfluxDB on Ubuntu 18.04

Source : https://computingforgeeks.com/install-influxdb-on-ubuntu-18-04-and-debian-9/

Installation of InfluxDB on Ubuntu 18.04 is done from Influxdata repository. Once the repo is added, the package can then be installed using an apt package manager. Add the InfluxData repository to the file  /etc/apt/sources.list.d/influxdb.list : 

$ echo "deb https://repos.influxdata.com/ubuntu bionic stable" | sudo tee /etc/apt/sources.list.d/influxdb.list


Update apt index and install influxdb 

$ sudo apt-get install -y influxdb
$ sudo apt-get install influxdb-client
Start and enable the service to start on boot up : 

$ sudo systemctl enable --now influxdb
$ sudo systemctl is-enabled influxdb
Check service status:
$ systemctl status influxdb

Open a terminal and check if influxdb is installed :

$ influxdb


