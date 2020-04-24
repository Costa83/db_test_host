//  Copyright (c) 2011-present, Facebook, Inc.  All rights reserved.
//  This source code is licensed under both the GPLv2 (found in the
//  COPYING file in the root directory) and Apache 2.0 License
//  (found in the LICENSE.Apache file in the root directory).

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <time.h>

#include "rocksdb/c.h"

#include <unistd.h>  // sysconf() - get CPU count

const char DBPath[] = "/tmp/rocksdb_simple_example";
const char DBBackupPath[] = "/tmp/rocksdb_simple_example_backup";

int main(int argc, char **argv) {


  struct timespec gettime_start;
  clock_gettime(CLOCK_REALTIME, &gettime_start);


  rocksdb_t *db;
  rocksdb_backup_engine_t *be;
  rocksdb_options_t *options = rocksdb_options_create();
  // Optimize RocksDB. This is the easiest way to
  // get RocksDB to perform well
  long cpus = sysconf(_SC_NPROCESSORS_ONLN);  // get # of online cores
  rocksdb_options_increase_parallelism(options, (int)(cpus));
  rocksdb_options_optimize_level_style_compaction(options, 0);
  // create the DB if it's not already present
  rocksdb_options_set_create_if_missing(options, 1);

	
  printf("\n < ----- Programme de test de RocksDB ----- > \n");
  // open DB 
  char *err = NULL;
  db = rocksdb_open(options, DBPath, &err);
  assert(!err);

  // open Backup Engine that we will use for backing up our database
  be = rocksdb_backup_engine_open(options, DBBackupPath, &err);
  assert(!err);

  // Put key-value
  rocksdb_writeoptions_t *writeoptions = rocksdb_writeoptions_create();
  const char key[] = "key";
  const char *value = "value";
  rocksdb_put(db, writeoptions, key, strlen(key), value, strlen(value) + 1,
              &err);
  assert(!err);

  struct timespec gettime_after;
  clock_gettime(CLOCK_REALTIME, &gettime_after);
  if (gettime_after.tv_nsec > gettime_start.tv_nsec)
		printf("Put key-value database :Total time taken by CPU : %u.%u\n",
					gettime_after.tv_sec - gettime_start.tv_sec,
					gettime_after.tv_nsec - gettime_start.tv_nsec);
	else
		printf("Put key-value database :Total time taken by CPU : %u.%u\n",
					gettime_after.tv_sec - gettime_start.tv_sec + 1,
					gettime_start.tv_nsec - gettime_after.tv_nsec);

  clock_gettime(CLOCK_REALTIME, &gettime_start);

  // Get value
  rocksdb_readoptions_t *readoptions = rocksdb_readoptions_create();
  size_t len;
  char *returned_value =
      rocksdb_get(db, readoptions, key, strlen(key), &len, &err);
  assert(!err);
  assert(strcmp(returned_value, "value") == 0);
  free(returned_value);

  clock_gettime(CLOCK_REALTIME, &gettime_after);
  if (gettime_after.tv_nsec > gettime_start.tv_nsec)
		printf("Get value database :Total time taken by CPU : %u.%u\n",
					gettime_after.tv_sec - gettime_start.tv_sec,
					gettime_after.tv_nsec - gettime_start.tv_nsec);
	else
		printf("Get value database :Total time taken by CPU : %u.%u\n",
					gettime_after.tv_sec - gettime_start.tv_sec + 1,
					gettime_start.tv_nsec - gettime_after.tv_nsec);

  // create new backup in a directory specified by DBBackupPath
  rocksdb_backup_engine_create_new_backup(be, db, &err);
  assert(!err);

  rocksdb_close(db);

  // If something is wrong, you might want to restore data from last backup
  rocksdb_restore_options_t *restore_options = rocksdb_restore_options_create();
  rocksdb_backup_engine_restore_db_from_latest_backup(be, DBPath, DBPath,
                                                      restore_options, &err);
  assert(!err);
  rocksdb_restore_options_destroy(restore_options);

  db = rocksdb_open(options, DBPath, &err);
  assert(!err);

  clock_gettime(CLOCK_REALTIME, &gettime_start);
  // cleanup
  rocksdb_writeoptions_destroy(writeoptions);
  rocksdb_readoptions_destroy(readoptions);
  rocksdb_options_destroy(options);
  rocksdb_backup_engine_close(be);
  rocksdb_close(db);


  clock_gettime(CLOCK_REALTIME, &gettime_after);
  if (gettime_after.tv_nsec > gettime_start.tv_nsec)
		printf("Cleanup database :Total time taken by CPU : %u.%u\n",
					gettime_after.tv_sec - gettime_start.tv_sec,
					gettime_after.tv_nsec - gettime_start.tv_nsec);
	else
		printf("Cleanup database :Total time taken by CPU : %u.%u\n",
					gettime_after.tv_sec - gettime_start.tv_sec + 1,
					gettime_start.tv_nsec - gettime_after.tv_nsec);

  return 0;
}
