//
//  main.m
//  CollectionDemo
//
//  Created by hongtao on 16/8/11.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSSet，不可修改的Set。
        NSSet *set = [NSSet setWithObjects:@"hello", @"world", @"obj-c", @3.14, @2.71828, @128, nil];
        NSLog(@"Thre are %lu elements in the set.", [set count]);
        NSLog(@"And They are: %@", set);
        NSLog(@"There is a 'abc'? %d", [set containsObject:@"abc"]);

        // NSMutableSet，可修改的Set（可以添加、删除元素）。
        NSMutableSet *mutableSet = [NSMutableSet set];
        [mutableSet addObject:@"hello world"];
        [mutableSet addObject:@123];
        NSLog(@"There is a 'hello world'? %d", [mutableSet containsObject:@"hello world"]);
        NSLog(@"There is a 123? %d", [mutableSet containsObject:@123]);
        NSLog(@"There is a 'abc'? %d", [mutableSet containsObject:@"abc"]);

        // NSCountedSet，带统计计数的Set（同一个元素可被添加多次，实际只保存一个对象，但它的计数会改变）。
        NSCountedSet *countedSet = [NSCountedSet set];
        [countedSet addObject:@"hello"];
        [countedSet addObject:@"hello"];
        [countedSet addObject:@"world"];
        NSLog(@"There are %lu elements in the counted set.", [countedSet count]);
        NSLog(@"And there are %lu 'hello'.", [countedSet countForObject:@"hello"]);
        NSLog(@"And there are %lu 'world'.", [countedSet countForObject:@"hello"]);
        NSLog(@"And there are %lu 'abc'.", [countedSet countForObject:@"abc"]);
    }
    return 0;
}
