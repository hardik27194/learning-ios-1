//
//  main.m
//  block
//
//  Created by hongtao on 16/9/13.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *originalStrings = @[@"SauerKraut", @"Raygun", @"Big Nerd Ranch", @"Mississippi"];
        NSLog(@"original strings: %@", originalStrings);

        NSMutableArray *devowelizedStrings = [NSMutableArray array];
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];

        void (^devowelizer)(id, NSUInteger, BOOL *);
        devowelizer = ^(id string, NSUInteger i, BOOL *stop) {
            NSMutableString *newString = [NSMutableString stringWithString:string];
            for (NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
            }
            [devowelizedStrings addObject:newString];
        };

        [originalStrings enumerateObjectsUsingBlock:devowelizer];
        NSLog(@"devowelized strings: %@", devowelizedStrings);
    }
    return 0;
}
