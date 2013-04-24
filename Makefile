LLtest: NSLinkedList.h NSLinkedList.m NSLinkedList-test.m
	clang -framework Foundation NSLinkedList.m NSLinkedList-test.m -o LLtest

LLtestARC: NSLinkedList.h NSLinkedList.m NSLinkedList-test.m
	clang -fobjc-arc NSLinkedList.m NSLinkedList-test.m -o LLtestARC

test: LLtest LLtestARC
	./LLtest
	./LLtestARC

clean:
	rm -f a.out *.o LLtest* *~*
