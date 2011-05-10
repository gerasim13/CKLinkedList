main: NSLinkedList.o NSLinkedList-test.m
	g++ -O2 -Wall NSLinkedList.o NSLinkedList-test.m -o LLtest -ObjC -framework Foundation


NSLinkedList: NSLinkedList.m NSLinkedList.h
	g++ -O2 -Wall -c NSLinkedList.m -ObjC -framework Foundation 2>/dev/null

test: main LLtest
	./LLtest

clean:
	rm -f a.out *.o LLTest *~* 
