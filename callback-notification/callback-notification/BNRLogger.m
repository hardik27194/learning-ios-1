//
//  BNRLogger.m
//  callback-notification
//
//  Created by hongtao on 16/8/30.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import "BNRLogger.h"

@implementation BNRLogger

- (void)zoneChanged:(NSNotification *)notification {
    NSLog(@"The system time zone has changed.");
}

@end
