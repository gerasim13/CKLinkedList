LLtest: CKLinkedList.h CKLinkedList.m CKLinkedList-test.m
	clang -framework Foundation CKLinkedList.m CKLinkedList-test.m -o LLtest

LLtestARC: CKLinkedList.h CKLinkedList.m CKLinkedList-test.m
	clang -fobjc-arc CKLinkedList.m CKLinkedList-test.m -o LLtestARC

test: LLtest LLtestARC
	./LLtest
	./LLtestARC

clean:
	rm -f a.out *.o LLtest* *~*
