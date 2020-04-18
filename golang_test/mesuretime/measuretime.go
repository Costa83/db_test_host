package measuretime

import (
    "fmt"
    "strconv"
    "time"
)

func measuretime_start() time.Time {
  start := time.Now()
  return start
}

func measuretime_stop(start time.Time) {

  duration := time.Since(start)

  fmt.Println("-------------------- Execution time -------------------- ")

  nanoseconds := duration.Nanoseconds()%1000;
  microsecondes := (duration.Nanoseconds()/1000)%1000;
  millisecondes := (duration.Nanoseconds()/1000000)%1000;
  secondes := duration.Nanoseconds()/1000000000;

  fmt.Println("Execution time create database : ")
  fmt.Println("#" + strconv.FormatInt(secondes,10) + "s:" + strconv.FormatInt(millisecondes,10) + "ms:" + strconv.FormatInt(microsecondes,10) + "us:" + strconv.FormatInt(nanoseconds,10) + "ns")
  fmt.Println("-------------------- -------------- -------------------- ")

}
