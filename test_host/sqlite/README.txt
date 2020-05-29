INSTALL UBUNTU SQLITE TEST :
-----------------------------

First on Ubuntu, connect to github and git clone this repository in your
project path

Follow all this command 

$ cd /SMILE_STAGE/SOURCES_GIT/TEST_HOST/
$ git clone https://github.com/Costa83/db_test_ubuntu.git

$ cd test_host/sqlite/

$ git clone https://github.com/LuaDist/libsqlite3.git
$ cd libsqlite3
$ ./configure
$ make
$ ls -l .libs
$ sudo su
$ make install
$ cd ..
$ chmod +x src/install.sh
$ cd src/
$ mkdir ../bin
$ ./install.sh
$ cd ..

The executable for the testapp are in /sqlite/bin

$ chmod +x script_test/test_X_rows.sh
$ cd script_test/
$ ./test_X_rows.sh
$ sudo cp /usr/local/lib/libsqlite3.so.0.8.6 /usr/lib/x86_64-linux-gnu/libsqlite3.so.0.8.6


###########################################
To use sqlite with the terminal (command shell) in ubuntu :


$ sqlite
sqlite> .database
sqlite> .tables
sqlite> select * from STT;


