package main

import "github.com/influxdata/influxdb1-client/v2"
import "fmt"
// import "time"
import "strconv"
import "flag"

func read_one_row_database_influxdb(id_row *int) {

  // start := time.Now()

  MyDB :=  "test_influxdb_go"

	c, err := client.NewHTTPClient(client.HTTPConfig{
		Addr: "http://localhost:8086",
	})
	if err != nil {
		fmt.Println("Error creating InfluxDB Client: ", err.Error())
	}
	defer c.Close()

  id := strconv.Itoa(*id_row)
  query_read := "select * from stt where value=" + id

	q := client.NewQuery(query_read, MyDB, "")

  // duration := time.Since(start)
  // fmt.Println("-------------------- Execution time -------------------- ")
  //
  // microsecondes := duration.Nanoseconds()/1000;
  // millisecondes := duration.Nanoseconds()/1000000;
  // secondes := duration.Nanoseconds()/1000000000;
  // nanoseconds := duration.Nanoseconds()%1000;
  //
  // fmt.Println("Execution time : ")
  // fmt.Println("#:" + strconv.FormatInt(secondes,10) + strconv.FormatInt(millisecondes,10) + "," + strconv.FormatInt(microsecondes,10) +  strconv.FormatInt(nanoseconds,10) + "s")
  // fmt.Println("#:" + strconv.FormatInt(millisecondes,10) +"," + strconv.FormatInt(microsecondes,10) + strconv.FormatInt(nanoseconds,10) + "ms")
  // fmt.Println("#:" + strconv.FormatInt(microsecondes,10) + "," + strconv.FormatInt(nanoseconds,10) + "us")
  // fmt.Println("#:" + strconv.FormatInt(duration.Nanoseconds(),10) + "ns")
  //
  // fmt.Println("-------------------- -------------- -------------------- ")
  response, err := c.Query(q)
  fmt.Println(response.Results)
}

func main() {
  id_row := flag.Int("id",1,"an int")
  flag.Parse()
  read_one_row_database_influxdb(id_row)
}
