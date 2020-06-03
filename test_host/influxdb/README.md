# INSTALLER INFLUXDB SUR LE PC HOTE, DEPUIS ZERO :


* On est sur une architecture client-serveur où ici le client et le serveur est situé sur le PC hote.
* Outils : GRAFANA, InfluxDB



## ETAPE 1: Installer GRAFANA :

Grafana est de loin l'écran de monitoring le plus populaire depuis 2019.
Utilisé par SpaceX, Bloomberg et Booking.com.
Il peut être utilisé pour supervisé différentes ressources :

SQL (MySQL or PostgreSQL), NoSQL, time series BD (InfluxDB / TimescaleDB)

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
