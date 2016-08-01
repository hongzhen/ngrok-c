CFLAGS=-Wall -fexceptions -DOPENSSL=0 -DISMEEDTLS=0 -O2
LD_FLAGS=-lpolarssl -lstdc++

all: ngrok

%.o: %.c
	$(CXX) $(CFLAGS) -o $@ -c $^

%.o: %.cpp
	$(CXX) $(CFLAGS) -o $@ -c $^

OBJS= main.o cJSON.o sendmsg.o nonblocking.o sslbio.o sslbio.o ngrok.o

ngrok: $(OBJS)
	$(CXX) $(LD_FLAGS) -o $@ $^

clean:
	rm -rf $(OBJS)



