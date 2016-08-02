//
//  main.m
//  TimeTwo
//
//  Created by hongtao on 16/8/2.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *currentTime = nil;
        NSLog(@"currentTime's value is %p", currentTime);

        currentTime = [NSDate date];
        NSLog(@"currentTime's value is %p", currentTime);

        sleep(2);
        currentTime = [NSDate date];
        NSLog(@"currentTime's value is %p", currentTime);
    }
    return 0;
}
