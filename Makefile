CFLAGS=-Wall -fexceptions -DOPENSSL=0 -DISMEEDTLS=0 -O2
LD_FLAGS=-lpolarssl -lstdc++
CC=g++

all: ngrok

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $^

%.o: %.cpp
	$(CC) $(CFLAGS) -o $@ -c $^

OBJS= main.o cJSON.o sendmsg.o nonblocking.o sslbio.o sslbio.o ngrok.o

ngrok: $(OBJS)
	$(CC) $(LD_FLAGS) -o $@ $^

clean:
	rm -rf $(OBJS)



