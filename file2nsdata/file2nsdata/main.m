//
//  main.m
//  file2nsdata
//
//  Created by hongtao on 16/8/18.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *filePath = @"/tmp/google.png";
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfFile:filePath options:0 error:&error];
        if (data) {
            NSLog(@"Done reading %@, the size is %lu", filePath, [data length]);
            return 0;
        } else {
            NSLog(@"Reading %@ failed, %@", filePath, [error localizedDescription]);
            return 1;
        }
    }
}
