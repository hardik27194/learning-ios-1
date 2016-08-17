//
//  Child.h
//  MemLeak
//
//  Created by floodliu on 16/8/4.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Parent;

@interface Child : NSObject

@property int objId;
@property (weak) Parent *parent;

- (instancetype)initWithId:(int)objId;

@end
