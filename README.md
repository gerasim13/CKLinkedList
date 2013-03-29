###A Simple Doubly linked list for Objective-C
* Linked Lists support efficient insertion/removal from anywhere in the list, whereas arrays are only efficient adding/removing to the end
* http://en.wikipedia.org/wiki/Linked_list

> "The principal benefit of a linked list over a conventional array is that the order of the linked items may be different from the order that the data items are stored in memory or on disk. For that reason, linked lists allow insertion and removal of nodes at any point in the list, with a constant number of operations.
On the other hand, linked lists by themselves do not allow random access to the data, or any form of efficient indexing. Thus, many basic operations — such as obtaining the last node of the list, or finding a node that contains a given datum, or locating the place where a new node should be inserted — may require scanning most of the list elements."

Example Usage:

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
					
