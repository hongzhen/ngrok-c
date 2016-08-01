CFLAGS=-DOPENSSL -DOPENSSLDL -rdynamic
LD_FLAGS=-lssl -ldl
CC=g++

all: ngrok

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $^

%.o: %.cpp
	$(CC) $(CFLAGS) -o $@ -c $^

OBJS= main.o cJSON.o sendmsg.o nonblocking.o sslbio.o sslbio.o ngrok.o openssldl.o

ngrok: $(OBJS)
	$(CC) $(LD_FLAGS) -o $@ $^

clean:
	rm -rf $(OBJS)



