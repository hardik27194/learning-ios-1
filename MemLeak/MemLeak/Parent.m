//
//  A.m
//  MemLeak
//
//  Created by floodliu on 16/8/4.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import "Parent.h"
#import "Child.h"

@implementation Parent

- (instancetype)initWithId:(int)objId
{
    self = [super init];
    if (self) {
        self.objId = objId;
    }
    return self;
}

- (NSString *)description {
    if (self.child) {
        return [NSString stringWithFormat:@"<parent: %d with child: %d>", self.objId, self.child.objId];
    } else {
        return [NSString stringWithFormat:@"<parent: %d without child>", self.objId];
    }
}

- (void)dealloc {
    NSLog(@"deallocating %@", self);
}

//- (void)setChild:(Child *)child {
//    self.child = child;
//    if (child) {
//        child.parent = self;
//    }
//}

@end
