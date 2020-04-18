package main

import "github.com/influxdata/influxdb1-client/v2"
import "fmt"
// import "log"
import "time"
import "strconv"
import "math/rand"

import "flag"




func write_database_influxdb(nb_row *int){


    source_tags := [3]string{"FAKE0","FAKE1","FAKE2"}

    type_tags := [5]string{"Puissance","Vitesse","Denivele","Calories","Distance"}

    unit_tags := [5]string{"Watts","km_h","m","Kcal","km"}

  c, err := client.NewHTTPClient(client.HTTPConfig{
    Addr: "http://localhost:8086",
  })
  if err != nil {
    fmt.Println("Error creating InfluxDB Client: ", err.Error())
  }
  defer c.Close()

  for i:=0;i<(*nb_row);i++ {

  	bp, _ := client.NewBatchPoints(client.BatchPointsConfig{
  		Database: "test_influxdb_go",
  		Precision: "s",
  	})
  	tags := map[string]string{"id":strconv.Itoa(i),"source": source_tags[i%3],"type":type_tags[i%5], "unit":unit_tags[i%5]}
  	fields := map[string]interface{}{
  		"value": rand.Intn(1000),
      "id": i,
  	}

    now :=  time.Now()
  	pt, err := client.NewPoint("stt", tags, fields, now)
  	if err != nil {
  		fmt.Println("Error: ", err.Error())
  	}
  	bp.AddPoint(pt)
    c.Write(bp)
  }
}


func main(){
    nb_rows := flag.Int("rows",1,"an int")
    flag.Parse()
    write_database_influxdb(nb_rows)
}
