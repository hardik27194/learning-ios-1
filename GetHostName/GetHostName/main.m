//
//  main.m
//  GetHostName
//
//  Created by hongtao on 16/8/1.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSHost *host = [NSHost currentHost];
        NSString *name = [host localizedName];
        NSLog(@"The host name is %@", name);
    }
    return 0;
}
