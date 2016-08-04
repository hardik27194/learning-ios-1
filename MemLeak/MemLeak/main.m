//
//  main.m
//  MemLeak
//
//  Created by floodliu on 16/8/4.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parent.h"
#import "Child.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        for (int i = 0; i < 10; i++) {
            Parent *parent = [[Parent alloc] initWithId:i];
            Child *child = [[Child alloc] initWithId:i];
            if (i % 2 == 0) {
                // parent和child之间循环引用，导致引用计数都不为0，因此ARC无法释放其内存，会导致内存泄漏。
                [parent setChild:child];
                [child setParent:parent];
            }
        }
    }
    sleep(100);
    return 0;
}
