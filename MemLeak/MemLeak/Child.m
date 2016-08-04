//
//  Child.m
//  MemLeak
//
//  Created by floodliu on 16/8/4.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import "Child.h"
#import "Parent.h"

@implementation Child

- (instancetype)initWithId:(int)objId {
    self = [super init];
    if (self) {
        self.objId = objId;
    }
    return self;
}

- (NSString *)description {
    if (self.parent) {
        return [NSString stringWithFormat:@"<child: %d with parent: %d>", self.objId, self.parent.objId];
    } else {
        return [NSString stringWithFormat:@"<child: %d without parent>", self.objId];
    }
}

- (void)dealloc {
    NSLog(@"deallocating %@", self);
}

@end
