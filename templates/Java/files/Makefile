
CLASSFILES := $(shell find src/* -type f -regex .*java | sed 's/src/bin/g' | sed 's/java/class/g')
CLASSPATH := src

all: ${CLASSFILES} 

bin/%.class: src/%.java
	@mkdir -p bin
	# compiling $^
	@javac -d bin/ -encoding UTF8 -cp ${CLASSPATH} $^

clean:
	-rm -rf bin/*