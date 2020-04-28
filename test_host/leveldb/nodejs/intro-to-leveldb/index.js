// COSTAGLIOLA Guillaume
// Test database LevelDB Integration in Buildroot

//Use the package level
var levelup = require('levelup')
var sublevel = require('level-sublevel')


//Create folder db in current directory
var db = sublevel(levelup('./db', {
	//db: require('level-js'),
	db: require('leveldown'),
	valueEncoding: 'json' }))

var mesuresdb = db.sublevel('Mesures')


function getRandomArbitrary(min, max) {
  return Math.random() * (max - min) + min;
}


var distance_km = 0;
var puissance_watts = 0;
var fc_bpm = 0;
var deniv_positif = 0;
var vitesse_kmh = 19;
var temperature_deg = 20;
var cadence_tpm = 75;


var i  = 0;
var measure = 'measure';
var source = ['FAKE0', 'FAKE1', 'FAKE2'];


var hrstart = process.hrtime()

var nb_lignes = 10000000;
console.log("Nombre de lignes : " + nb_lignes );

for (let i = 0; i < nb_lignes ; i++) {

	i_string = i.toString();

	distance_km =  distance_km + getRandomArbitrary(0,2);
	mesuresdb.put(measure.concat(' ', i_string), { id: i_string, source :source[i%3], type : 'distance', value : Math.round(distance_km*100)/100, unit : 'km' }, function (err) {})
	i = i + 1;
	i_string = i.toString();


  puissance_watts = getRandomArbitrary(0,400);
	mesuresdb.put(measure.concat(' ', i_string), { id: i_string, source :source[i%3], type : 'puissance', value : Math.round(puissance_watts*100)/100 , unit : 'watts' }, function (err) {})
	i = i + 1;
	i_string = i.toString();


	fc_bpm = getRandomArbitrary(70,210);
	mesuresdb.put(measure.concat(' ', i_string), { id: i_string, source :source[i%3], type : 'fc', value : Math.round(fc_bpm) , unit : 'bpm'}, function (err) {})
	i = i + 1;
	i_string = i.toString();

	deniv_positif = deniv_positif + getRandomArbitrary(0,30);
	mesuresdb.put(measure.concat(' ', i_string), { id: i_string, source :source[i%3], type : 'deniv', value : Math.abs(Math.round(deniv_positif)) , unit : 'D+'}, function (err) {})
	i = i + 1;
	i_string = i.toString();


	vitesse_kmh = vitesse_kmh - getRandomArbitrary(-5,5);
	mesuresdb.put(measure.concat(' ', i_string), { id: i_string, source :source[i%3], type : 'vitesse', value : Math.abs(Math.round(vitesse_kmh*100)/100) , unit : 'km/h' }, function (err) {})
	i = i + 1;
	i_string = i.toString();


	temperature_deg = temperature_deg - getRandomArbitrary(-5,5);
	mesuresdb.put(measure.concat(' ', i_string), { id: i_string, source :source[i%3], type : 'temperature', value : Math.abs(Math.round(temperature_deg*10)/10) , unit : '°C'}, function (err) {})
	i = i + 1;
	i_string = i.toString();

  cadence_tpm = cadence_tpm - getRandomArbitrary(-20,20);
	mesuresdb.put(measure.concat(' ', i_string), { id: i_string, source :source[i%3], type : 'cadence', value : Math.abs(Math.round(cadence_tpm)) , unit : 'tpm' }, function (err) {})
	i = i + 1;

}

var  hrend = process.hrtime(hrstart)
console.info('Execution time (hr): %ds %dms', hrend[0], hrend[1] / 1000000);
