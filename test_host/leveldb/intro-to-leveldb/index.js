
//Use the package level
var levelup = require('levelup')
var sublevel = require('level-sublevel')



//Create folder db in current directory
var db = sublevel(levelup('./db', {
	//db: require('level-js'),
	db: require('leveldown'),
	valueEncoding: 'json' }))

var mesuresdb = db.sublevel('Mesures')


mesuresdb.put('mesure1', { id: '1', type : 'distance', value : '300 km', unit : 'km' }, function (err) {})
mesuresdb.put('mesure2', { id: '2', type : 'puissance', value : '382' , unit : 'watts' }, function (err) {})
mesuresdb.put('mesure3', { id: '3', type : 'fc', value : '182' , unit : 'bpm'}, function (err) {})
mesuresdb.put('mesure4', { id: '4', type : 'deniv', value : '711' , unit : 'D+'}, function (err) {})
mesuresdb.put('mesure5', { id: '5', type : 'vitesse', value : '29,2' , unit : 'km/h' }, function (err) {})
mesuresdb.put('mesure6', { id: '6', type : 'temperature', value : '26.2' , unit : '°C'}, function (err) {})
mesuresdb.put('mesure7', { id: '7', type : 'cadence', value : '90' , unit : 'tpm' }, function (err) {})






