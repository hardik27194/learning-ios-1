//
//  A.m
//  extentionDemo
//
//  Created by hongtao on 16/8/3.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import "A.h"

@interface A ()

@property int privateValue;

@end

@implementation A

- (int)getPrivateValue {
    return self.privateValue;
}

@end
