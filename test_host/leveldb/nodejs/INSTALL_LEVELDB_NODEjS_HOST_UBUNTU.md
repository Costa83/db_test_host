# Installation de LevelDB NODE JS sur PC HOST UBUNTU

Ce readme détaille les étapes d'installation.
Tiré du Tutoriel de https://www.youtube.com/watch?v=sR7p_JbEip0.

## Featuresof Node JS



Nodejs est un logiciel permettant d'exécuter du JavaScript côté serveur, contrairement à ce qu'on a l'habitude de voir avec le javascript côté client.

L'avantage d'utiliser Nodejs est que javascript permet l'exécution de tâches asynchrones, ce qui peut être pratique dans certaines situations. C'est de plus en plus souvent le cas avec le « nouveau » web qui arrive (html5/css3, etc.).
De plus, Nodejs permet de créer des applications « serveur » facilement grâce à des applications tierces qu'il prend en charge via un logiciel similaire à un gestionnaire de paquets.

 

### Installing

A step by step series of examples that tell you how to get a development

...
sudo apt-get update
```
### Installing LevelDB

Features : A lot of modules.


$  sudo apt-get install nodejs
$  sudo apt-get install npm

$ cd /home/gucos/STAGGE..../leveldb/
$ mkdir intro-to-leveldb/
$ gedit package.json
$ gedit index.js

$ npm install
$ npm install --no-optional
$ npm install level --save

$ gedit index.js

-> Use the package leveldb, create folder db, use key value with db.put et db.get , et db.del. (By following exemple in github exemple.js).

...
Run the script with our server "node"

$ node index.js


Organize database by type
$  npm i level-sublevel --save

On développe avec plusieurs sous databases.
Notre database est composé de sous databases.

---------------------------------------------------------------------



--------------------------------------------------------------------------

Use on cloud side. Run the same code in browe, save on chrome.
LevelDB was developped by Google.

### Use the API :


$ npm i levelup leveldown --save


Need to add in index.js the two var with require.

We need to specify expplicitely that levelup is used for API and leveldown by default (but here as interface)

Run 

$ node index.js

$ npm i levelup level-dash --save

To run the app:
...
$ npm start
... 

To view :
...
Connect to : "http://localhost:9966" 

Inspecter l'élément, Aller dans Stockage puis IndexedDB puis http://localhost:9966/ puis IDBWrapper et ./db

On peut alors directement accéder aux Key Value.



Key : Measure_X
Value : valeur
Mesure 1 : Distance
« 300 km»
Mesure 2 : Puissance 
« 300 Watts »
Mesure 3 : Fréquence cardiaque
« 180 bpm »
Mesure 4 : Dénivelé positif
« 711D+ »
Mesure 5 : Vitesse
« 42 Km/h»
Mesure 7 : Température
« 25 ° C »
Mesure 8 : Cadence Pédalage
« 89 tpm »

