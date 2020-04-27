# Installation de LevelDB sur PC HOST UBUNTU

Ce readme détaille les étapes d'installation.

## Features


    Keys and values are arbitrary byte arrays.
    Data is stored sorted by key.
    Callers can provide a custom comparison function to override the sort order.
    The basic operations are Put(key,value), Get(key), Delete(key).
    Multiple changes can be made in one atomic batch.
    Users can create a transient snapshot to get a consistent view of data.
    Forward and backward iteration is supported over the data.
    Data is automatically compressed using the Snappy compression library.
    External activity (file system operations etc.) is relayed through a virtual interface so users can customize the operating system interactions.



## Limitations

Ce n'est pas une base de donnée SQL. Le modèle n'est pas relationnel, pas de requetes SQL ni de support d'index.
Un seul processus peut accéder à la base de donnée.
Ce n'est pas un modèle client serveur.


## Getting Started


https://github.com/google/leveldb

### Prerequisites

Have cmake tool, git tool

```
$ sudo apt  install cmake
```

### Installing

A step by step series of examples that tell you how to get a development env running

Git clone depuis le répertoire officiel dans /test_host/leveldb/

```
$ git clone --recurse-submodules https://github.com/google/leveldb.git
```

Building for POSIX:
...

$ cd leveldb
$ mkdir -p build && cd build
$ cmake -DCMAKE_BUILD_TYPE=Release .. && cmake --build
...
Copying library leveldb
...

$ sudo cp libleveldb.a /usr/local/lib/
$ sudo ldconfig


