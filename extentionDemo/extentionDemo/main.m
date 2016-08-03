//
//  main.m
//  extentionDemo
//
//  Created by hongtao on 16/8/3.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "A.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 在A.h中定义的属性，可以直接在类外访问。
        A *a = [[A alloc] init];
        a.value = 123;
        NSLog(@"the value is %d", a.value);

        // 不在A.h中定义的属性，是私有的，不能在类外访问。但是可以在类内访问。
        // A.privateValue = 999;
        NSLog(@"the private value is %d", [a getPrivateValue]);
    }
    return 0;
}
