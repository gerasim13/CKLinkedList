LLtest: NSLinkedList.o NSLinkedList-test.m
	g++ -O2 -Wall NSLinkedList.o NSLinkedList-test.m -o LLtest -ObjC -framework Foundation


NSLinkedList.o: NSLinkedList.m NSLinkedList.h
	g++ -O2 -Wall -c NSLinkedList.m -ObjC

test: LLtest
	./LLtest

clean:
	rm -f a.out *.o LLTest *~* 
