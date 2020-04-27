# Installation de LevelDB sur PC HOST UBUNTU

Ce readme détaille les étapes d'installation.

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

mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release .. && cmake --build

