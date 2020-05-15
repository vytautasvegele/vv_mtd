CS=$(wildcard ./*.c)
OS=$(CS:.c=.o)

all: cec15.so cec15_test

%.o: %.c
	gcc -c -fPIC -I. $<

cec15_test: $(OS)
	gcc -o cec15_test $(OS) -lm
	
cec15.so: $(OS)
	gcc -shared -o cec15.so $(OS) -lm

clean:
	rm -f cec15_test *.o cec15.so