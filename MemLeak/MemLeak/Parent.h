//
//  A.h
//  MemLeak
//
//  Created by floodliu on 16/8/4.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Child;

@interface Parent : NSObject

@property int objId;
@property Child *child;

- (instancetype)initWithId:(int)objId;

@end
