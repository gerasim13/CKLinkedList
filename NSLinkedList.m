//
//  NSLinkedList.m
//  Quarantine
//
//  Created by Matt Schettler on 5/30/10.
//  Copyright 2010 mschettler@gmail.com. All rights reserved.
//

#import "NSLinkedList.h"

@implementation NSLinkedList
@synthesize first, last;

- (id)init {
    
    if ((self = [super init]) == nil) return nil;
    
    first = last = nil;
    size = 0;
    
    return self;
}


- (id)initWithObject:(id)anObject {
    
    if ((self = [super init]) == nil) return nil;
    
    LNode *n = LNodeMake(anObject, nil, nil);
    
    first = last = n;
    size = 1;
    
    return self;
}


- (void)pushBack:(id)anObject {
    
    if (anObject == nil) return;
    
    LNode *n = LNodeMake(anObject, nil, last);
    
    if (size == 0) {
        first = last = n;
    } else {
        last->next = n;
        last = n;
    }
    
    size++;
    
}


- (id)lastObject {

    if (last) {
        return last->obj;
    }
    
    return nil;
    
}


- (id)firstObject {
    
    if (first) {
        return first->obj;
    }
    
    return nil;
    
}


- (LNode *)firstNode {
    
    return first;
    
}


- (LNode *)lastNode {
    
    return last;
    
}


- (id)secondLastObject {
    
    if (last) {
        if (last->prev) {
            return last->prev->obj;
        }
    }
    
    return nil;
    
}


- (id)top {
    return [self lastObject];
}


- (void)pushFront:(id)anObject {
    
    if (anObject == nil) return;
    
    LNode *n = LNodeMake(anObject, first, nil);
    
    if (size == 0) {
        first = last = n;
    } else {
        first->prev = n;
        first = n;
    }
    
    size++;
    
}


- (void)prependObject:(id)anObject {
    [self pushFront:anObject];
}


- (void)appendObject:(id)anObject {
    [self pushBack:anObject];
}


- (void)insertObject:(id)anObject beforeNode:(LNode *)node {

    [self insertObject:anObject betweenNode:node->prev andNode:node];
}


- (void)insertObject:(id)anObject afterNode:(LNode *)node {
    
    [self insertObject:anObject betweenNode:node andNode:node->next];
}


- (void)insertObject:(id)anObject betweenNode:(LNode *)previousNode andNode:(LNode *)nextNode {
    
    if (anObject == nil) return;
    
    LNode *n = LNodeMake(anObject, nextNode, previousNode);
    
    if (previousNode) {
        previousNode->next = n;
    } else {
        first = n;
    }
    
    if (nextNode) {
        nextNode->prev = n;
    } else {
        last = n;
    }
    
    size++;
    
}


- (void)addObject:(id)anObject {
    [self pushBack:anObject];
}


- (void)pushNodeBack:(LNode *)n {
    
    if (size == 0) {
        first = last = LNodeMake(n->obj, nil, nil);
    } else {
        last->next = LNodeMake(n->obj, nil, last);
        last = last->next;
    }
    
    size++;
    
}


- (void)pushNodeFront:(LNode *)n {
    
    if (size == 0) {
        first = last = LNodeMake(n->obj, nil, nil);
    } else {
        first->prev = LNodeMake(n->obj, first, nil);
        first = first->prev;
    }
    
    size++; 
}


- (id)popBack {
    
    if (size == 0) return nil;
    
    id ret = last->obj;
    LNode *mem = last;
    
    if (size == 1) { 
        first = last = NULL;
    } else {
        last = last->prev;
        last->next = NULL;
    }
    
    [mem->obj release];
    free(mem);
    size--;
    return ret;
    
}


- (id)popFront {
    
    if (size == 0) return nil;
    
    id ret = first->obj;
    LNode *mem = first;
    
    if (size == 1) { 
        first = last = nil;
    } else {
        first = first->next;
        first->prev = nil;
    }
    
    [mem->obj release];
    free(mem);
    size--;
    return ret;
    
}


- (void)removeNode:(LNode *)aNode {
    
    if (size == 0) return;
    
    if (size == 1) {
        // delete first and only 
        first = last = nil;
    } else if (aNode->prev == nil) {
        // delete first of many
        first = first->next;
        first->prev = nil;
    } else if (aNode->next == nil) {
        // delete last
        last = last->prev;
        last->next = nil;
    } else {
        // delete in the middle
        LNode *tmp = aNode->prev;
        tmp->next = aNode->next;
        tmp = aNode->next;
        tmp->prev = aNode->prev;
    }
    
    [aNode->obj release];
    free(aNode);
    size--;
    
    
}


- (BOOL)removeObjectEqualTo:(id)anObject {
    
    LNode *n = nil;
    
    for (n = first; n; n=n->next) {
        if (n->obj == anObject) {
            [n->obj release];
            [self removeNode:n];
            return YES;
        }
    }   
    
    return NO;
    
}


- (void)removeAllObjects {
    
    LNode *n = first;
    
    while (n) {
        LNode *next = n->next;
        [n->obj release];
        free(n);
        n = next;
    }
    
    first = last = nil;
    size = 0;
}



- (void)dumpList {
    LNode *n = nil;
    for (n = first; n; n=n->next) {
        NSLog(@"%p", n);
    }   
}



- (void)insertObject:(id)anObject orderedPositionByKey:(NSString *)key ascending:(BOOL)ascending {
    assert(0); // currently not implemented
}


- (int)count  { return size; }
- (int)size   { return size; }
- (int)length { return size; }


- (BOOL)containsObject:(id)anObject {
    
    LNode *n = nil;
    
    for (n = first; n; n=n->next) {
        if (n->obj == anObject) return YES;
    }
    
    return NO;
    
}


- (NSArray *)allObjects {

    NSMutableArray *ret = [NSMutableArray new];
    LNode *n = nil;
    
    for (n = first; n; n=n->next) {
        [ret addObject:n->obj];
    }

    return [ret autorelease];
}


- (void)dealloc {
    [self removeAllObjects];
    [super dealloc];
}


- (NSString *)description {
    return [NSString stringWithFormat:@"NSLinkedList with %d objects", size];
}


@end

LNode * LNodeMake(id obj, LNode *next, LNode *prev) {
    LNode *n = malloc(sizeof(LNode));
    n->next = next;
    n->prev = prev;
    n->obj = [obj retain];
    return n;
};



