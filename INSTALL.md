# Installation

## Prerequisites

Install required packages on Ubuntu/Debian:

```bash
sudo apt-get update
sudo apt-get install -y build-essential make sqlite3 libsqlite3-dev
```

Optional runtimes used during function execution:

```bash
sudo apt-get install -y php-cli
# wasmer is optional and installed separately if you run wasm routes
```

## Build

Preferred build flow:

```bash
make clean
make
```

This creates:
- `build/worker`
- `build/gateway`

## Initialize Database

```bash
make init
```

This creates `faas_meta.db` from `init.sql`.

## Start and Stop

```bash
make start
make stop
```

## Script-Based Alternative

```bash
chmod +x start.sh stop.sh clean.sh
./start.sh
```

## Compilation Troubleshooting

### `undefined reference` errors from `start.sh`

Use the Makefile path first:

```bash
make clean
make
```

The script build must include:
- `fd_passing.o` when linking worker and gateway
- `http_handler.o` when linking worker

### `WEXITSTATUS` unresolved in `faas_compiler.c`

Ensure the source includes:

```c
#include <sys/wait.h>
```

### SQLite header/library not found

```bash
sudo apt-get install -y sqlite3 libsqlite3-dev
ls /usr/include/sqlite3.h
```

### Shell script `^M` errors (Windows line endings)

```bash
sed -i 's/\r$//' *.sh benchmarks/*.sh
chmod +x *.sh benchmarks/*.sh
```
