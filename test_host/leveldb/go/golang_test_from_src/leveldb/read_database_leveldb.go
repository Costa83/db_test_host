package leveldb

import (
    "github.com/syndtr/goleveldb/leveldb"
    "fmt"
)

func Read_all_rows_database_leveldb() {

	db, err := leveldb.OpenFile("path/to/db", nil)

	data, err := db.Get([]byte("key"), nil)

	defer db.Close()

}
