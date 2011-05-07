//
// NSLinkedList Tests
//
// compile with:
// g++ -c NSLinkedList.m -ObjC -framework Foundation 2>/dev/null; g++ NSLinkedList.o NSLinkedList-test.m -o LLtest -ObjC -framework Foundation
// test with:
// ./LLtest

#import <assert.h>
#import "NSLinkedList.h"

static int i;

/*
 Tests these functions:
 - (id)init;									// init an empty list
 - (id)initWithObject:(id)anObject;			// init the linked list with a single object
 */
void test_init() {
    
    NSLinkedList *list1 = [[NSLinkedList alloc] init];
    assert(list1);
    assert([list1 count] == 0);
    
    NSLinkedList *list2 = [[NSLinkedList alloc] initWithObject:@"NSString"];
    assert(list2);
    assert([list2 count] == 1);
    
    
    
}


/*
 Tests these functions:
 - (void)pushBack:(id)anObject;				// add an object to back of list
 - (void)pushFront:(id)anObject;				// add an object to front of list
 - (void)addObject:(id)anObject;				// same as pushBack
 - (id)popBack;								// remove object at end of list (returns it)
 - (id)popFront;								// remove object at front of list (returns it)
 - (void)removeNode:(LNode *)aNode;			// remove a given node
 - (BOOL)removeObjectEqualTo:(id)anObject;	// removes object equal to anObject, returns (YES) on success
 - (void)removeAllObjects;					// clear out the list
 - (void)dumpList;							// dumps all the pointers in the list to NSLog
 - (BOOL)containsObject:(id)anObject;		// (YES) if passed object is in the list, (NO) otherwise
 - (int)count;								// how many objects are stored
 - (void)pushNodeBack:(LNode *)n;			// adds a node object to the end of the list
 - (void)pushNodeFront:(LNode *)n;			// adds a node object to the beginning of the list
 */
void test_add_remove() {
    
    NSLinkedList *list = [[NSLinkedList alloc] init];
    NSString *str1 = @"This is a test string";
    NSString *str2 = @"This is another test string";
    NSString *str3 = @"This is a third test string";
    
    assert(list);
    
    
    [list pushBack:str1];
    assert([list count] == 1);
    assert([list containsObject:str1]);

    [list pushFront:str2];
    assert([list count] == 2);
    assert([list containsObject:str2]);

    
    [list removeObjectEqualTo:str1];
    assert([list count] == 1);
    assert(![list containsObject:str1]);
    
    [list removeAllObjects];
    assert([list count] == 0);
    
    const int FILL_COUNT = 100;
    
    for (i = 0; i < FILL_COUNT; i++) {
        [list addObject:[NSString stringWithFormat:@"%d", i]];
    }
    

    assert([list count] == FILL_COUNT);
    
    id node = [list popFront];
    assert([list count] == FILL_COUNT-1);
    assert(node);
    assert([(NSString *)node isEqualToString:@"0"]);

    
           
    node = [list popBack];
    assert([list count] == FILL_COUNT-2);
    assert(node);
    assert([(NSString *)node isEqualToString:@"99"]);
          

    
    
    
    
}

/* Untested:
- (void)removeNode:(LNode *)aNode;			// remove a given node
- (void)pushNodeBack:(LNode *)n;			// adds a node object to the end of the list
- (void)pushNodeFront:(LNode *)n;			// adds a node object to the beginning of the list
- (void)insertObject:(id)anObject beforeNode:(LNode *)node;
- (void)insertObject:(id)anObject afterNode:(LNode *)node;
- (void)insertObject:(id)anObject betweenNode:(LNode *)previousNode andNode:(LNode *)nextNode;
- (void)prependObject:(id)anObject;
- (void)appendObject:(id)anObject;
*/


int main(int argc, const char *argv[]) {
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    
    test_init();
    test_add_remove();
    
    
    
    
    printf("All tests passed\n");
    
    return 0;
}