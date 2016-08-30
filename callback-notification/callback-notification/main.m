//
//  main.m
//  callback-notification
//
//  Created by hongtao on 16/8/30.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRLogger *logger = [[BNRLogger alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:logger selector:@selector(zoneChanged:) name:NSSystemTimeZoneDidChangeNotification object:nil];

        NSLog(@"begin to listen to system notifications");
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
