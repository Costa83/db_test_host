package main

import "github.com/influxdata/influxdb1-client/v2"
import "fmt"
import "time"
import "strconv"

func delete_database_influxdb() {

  start := time.Now()
  MyDB :=  "test_influxdb_go"

	c, err := client.NewHTTPClient(client.HTTPConfig{
		Addr: "http://localhost:8086",
	})
	if err != nil {
		fmt.Println("Error creating InfluxDB Client: ", err.Error())
	}
	defer c.Close()


	q := client.NewQuery("delete from stt", MyDB, "")
  duration := time.Since(start)
  c.Query(q)

  fmt.Println("-------------------- Execution time -------------------- ")

  nanoseconds := duration.Nanoseconds()%1000;
  microsecondes := (duration.Nanoseconds()/1000)%1000000;
  millisecondes := (duration.Nanoseconds()/1000000)%1000000000;
  secondes := duration.Nanoseconds()/1000000000;

  fmt.Println("Execution time : ")
  fmt.Println("#:" + strconv.FormatInt(secondes,10) + ":" + strconv.FormatInt(millisecondes,10) + ":" + strconv.FormatInt(microsecondes,10) + ":" + strconv.FormatInt(nanoseconds,10))
  fmt.Println("-------------------- -------------- -------------------- ")
}

func main() {
  delete_database_influxdb()
}
