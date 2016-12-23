CC=gcc
FLAGS=
LINK=
OBJS= libngx_hash.so


all: $(OBJS)

ngx_hash.o: ngx_hash.c
	$(CC) -c $(*).c

libngx_hash.so: ngx_hash.o
	$(CC)  -fPIC -shared *.o -o libngx_hash.so


.PHONY: clean test
test:
	export LD_LIBRARY_PATH=./
	echo "run test....."
	luajit test.lua 1234567890abc


clean:
	rm -rf libngx_hash.so *.o
