###A *Doubly* linked list for Objective-C

> "The principal benefit of a linked list over a conventional array is that the order of the linked items may be different from the order that the data items are stored in memory or on disk. For that reason, linked lists allow insertion and removal of nodes at any point in the list, with a constant number of operations.
On the other hand, linked lists by themselves do not allow random access to the data, or any form of efficient indexing. "

* [Wikipedia - Linked List](http://en.wikipedia.org/wiki/Linked_list)

###Installation 

1. Add `NSLinkedList.h` and `NSLinkedList.m` to your project, for example in your `3rdparty` directory
2. Add `#import "NSLinkedList.h"` to your project's `.pch` file
3. NSLinkedList class is now avaiable anywhere in your project, enjoy!

###Benefits vs. NSArray
* Efficient insertion and removal of elements at any index
* Efficient memory allocation (No need to resize/reallocate memory)


###Example Usage

	NSLinkedList *myList = [[NSLinkedList alloc] init];

	[myList addObject:obj2];  // add object to end of list
	[myList addObject:obj3];  // add object to end of list
	[myList pushFront:obj1];  // add object to front of list, no performance penalty

	// linked list now contains obj1->obj2->obj3 in that order [NSStrings, or any object]
	
	// loop through list, forward
	for (LNode *n = myList->first; n; n=n->next) {
		NSString *theString = n->obj;
		NSLog(@"string: %@", theString);
	}

	// ...
	// ...

	[myList release];
					
