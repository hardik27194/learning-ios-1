//
//  main.m
//  nsdata2file
//
//  Created by hongtao on 16/8/18.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 第一步：从某个网址获取其内容，构造一个NSData对象。
        NSURL *url = [NSURL URLWithString:@"http://www.google.com/images/logos/ps_logo2.png"];
        NSError *error = nil;
        NSData *data = [NSData dataWithContentsOfURL:url options:0 error:&error];
        if (!data) {
            NSLog(@"fetch data failed, %@", [error localizedDescription]);
            return 1;
        }

        // 第二步：把NSData写入文件。
        NSString *filePath = @"/tmp/google.png";
        BOOL success = [data writeToFile:filePath options:0 error:&error];
        if (success) {
            NSLog(@"Done writing %@", filePath);
            return 0;
        } else {
            NSLog(@"Writing %@ failed, %@", filePath, [error localizedDescription]);
            return 2;
        }
    }
    return 0;
}
