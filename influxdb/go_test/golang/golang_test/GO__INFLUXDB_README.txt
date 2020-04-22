INSTALL TESTS EN GO (INFLUXDB) sur  UBUNTU HOST :

On est sur une architecture client-serveur où ici le client et le serveur est situé sur le PC hote.



## Prérequis 0 : Installer GRAFANA & INFLUXDB (CLIENT & SERVER) voir DOC ../

Pour installer le package :

Depuis le git clone :

?/influx_test/
		golang_test/
			influx_db/
			measure_time/
			test/

$ go mod init ../golang_tets
$ go mod tidy

génère un go.mod et un go.sum

cp influx_db/* /usr/local/go/src
cp measure_time/* /usr/local/go/src

go build test/main.go

génère main.go


Pour BR2 on fait pareil :

	On git clone le réperoire golang_test dans le répertoire qui est appelé par BR2 (APP EXTERNES).

Dans package/influx_db_golang/
	Création d’un Config.in
	Création d’un influx_db_go_test.mk




























Pour développer en GO :

$ mkdir myproject
$ cd myproject
$ go mod init 
$ mkdir mypackage
$ créer .go
$ go mod tidy
(ou $ make influxdb_go_test create_database)
$ go build -o bin/ ./package
$ go build -o bin/ create_database/createdatabse_influxdb.go


#SUR BR2 :

Créer un répertoire influxdb_go dans package/

	Créer un .config
	Créer un .mk

#POUR RPI

Puis scp dans /usr/bin/ de la RPI de l’excutable.


Trois niveau : repository = ! modules, module!= direcrory, directory = package!= src files


Install go.1.14

$ go version

Go est un langage compilé qui n’a pas de dépendance une fois compilé pour fonctionner sur la cible.

1- Depuis le répertoire projet :
 
Pour activer la compilation croisée : il faut changer une variable d’environnement :

$ go tool dist list
$ GOOS=linux
$ GOARCH=amd64
$ go build -o ./bin./..

$ go build -o bin ./hello hello.go
 




$ go mod init
$ go mod tidy
$go mod 





## ETAPE 1: Installer InfluxDB en Go:

tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz

export PATH=$PATH:/usr/local/go/bin
