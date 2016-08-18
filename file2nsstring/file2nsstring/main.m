//
//  main.m
//  file2nsstring
//
//  Created by hongtao on 16/8/18.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *filePath = @"/etc/resolv.conf";
        NSError *error;
        NSString *str = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:&error];
        if (str) {
            NSLog(@"The contents of %@ is:\n%@", filePath, str);
        } else {
            NSLog(@"Read %@ failed, %@", filePath, [error localizedDescription]);
        }
    }
    return 0;
}
