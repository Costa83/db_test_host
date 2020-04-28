package leveldb

import (
    "github.com/syndtr/goleveldb/leveldb"
    "fmt"
)

func Create_database_leveldb() {

	// The returned DB instance is safe for concurrent use. Which mean that all
	// DB's methods may be called concurrently from multiple goroutine.

	db, err := leveldb.OpenFile("./db", nil)
	defer db.Close()


}
