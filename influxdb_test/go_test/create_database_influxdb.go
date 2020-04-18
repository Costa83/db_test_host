package main

import "github.com/influxdata/influxdb1-client/v2"
import "fmt"
import "time"
import "strconv"

func create_database_influxdb() {

  start := time.Now()
  MyDB := "test_influxdb_go"

	c, err := client.NewHTTPClient(client.HTTPConfig {
		Addr: "http://localhost:8086",
	})
	if err != nil {
		fmt.Println("Error creating InfluxDB Client: ", err.Error())
	}
	defer c.Close()


	q := client.NewQuery("create database test_influxdb_go", MyDB, "")
  c.Query(q)
  duration := time.Since(start)


  fmt.Println("-------------------- Execution time -------------------- ")
  fmt.Println("#:" + strconv.FormatInt(duration.Nanoseconds(),10) + "ns")

}

func main() {
  create_database_influxdb()
}
