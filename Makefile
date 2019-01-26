CC = g++ 
CFLAGS = -Wall -g
LIBS = -lpthread 
TARGET = raw_test 
RM = rm -f 
OBJS = parameters.o worker.o demultiplex.o
CPPOBJS = client_handle.o server.o timer.o main.o
#all:$(OBJS)
	#$(CC) -o $(TARGET) $(CFLAGS) $(OBJS) $(LIBS) 

$(TARGET):$(OBJS) $(CPPOBJS)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

$(OBJS):%.o:%.c
	$(CC) -c $< -o $@ $(CFLAGS)

$(CPPOBJS):%.o:%.cpp
	$(CC) -c $< -o $@ $(CFLAGS)

clean:
	$(RM) $(TARGET) $(OBJS) $(CPPOBJS)
