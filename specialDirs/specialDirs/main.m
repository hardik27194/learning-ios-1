//
//  main.m
//  specialDirs
//
//  Created by hongtao on 16/8/18.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>

NSNumber* toNSNumber(NSUInteger dir) {
    return [NSNumber numberWithUnsignedLong:dir];
}

NSUInteger toNSUInteger(NSNumber *number) {
    return [number unsignedLongValue];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary *dirTypes = @{
            @"NSApplicationDirectory": toNSNumber(NSApplicationDirectory),
            @"NSDemoApplicationDirectory": toNSNumber(NSDemoApplicationDirectory),
            @"NSDeveloperApplicationDirectory": toNSNumber(NSDeveloperApplicationDirectory),
            @"NSAdminApplicationDirectory": toNSNumber(NSAdminApplicationDirectory),
            @"NSLibraryDirectory": toNSNumber(NSLibraryDirectory),
            @"NSDeveloperDirectory": toNSNumber(NSDeveloperDirectory),
            @"NSUserDirectory": toNSNumber(NSUserDirectory),
            @"NSDocumentationDirectory": toNSNumber(NSDocumentationDirectory),
            @"NSDocumentDirectory": toNSNumber(NSDocumentDirectory),
            @"NSCoreServiceDirectory": toNSNumber(NSCoreServiceDirectory),
            @"NSAutosavedInformationDirectory": toNSNumber(NSAutosavedInformationDirectory),
            @"NSDesktopDirectory": toNSNumber(NSDesktopDirectory),
            @"NSCachesDirectory": toNSNumber(NSCachesDirectory),
            @"NSApplicationSupportDirectory": toNSNumber(NSApplicationSupportDirectory),
            @"NSDownloadsDirectory": toNSNumber(NSDownloadsDirectory),
            @"NSInputMethodsDirectory": toNSNumber(NSInputMethodsDirectory),
            @"NSMoviesDirectory": toNSNumber(NSMoviesDirectory),
            @"NSMusicDirectory": toNSNumber(NSMusicDirectory),
            @"NSPicturesDirectory": toNSNumber(NSPicturesDirectory),
            @"NSPrinterDescriptionDirectory": toNSNumber(NSPrinterDescriptionDirectory),
            @"NSSharedPublicDirectory": toNSNumber(NSSharedPublicDirectory),
            @"NSPreferencePanesDirectory": toNSNumber(NSPreferencePanesDirectory),
            @"NSApplicationScriptsDirectory": toNSNumber(NSApplicationScriptsDirectory),
            @"NSItemReplacementDirectory": toNSNumber(NSItemReplacementDirectory),
            @"NSAllApplicationsDirectory": toNSNumber(NSAllApplicationsDirectory),
            @"NSAllLibrariesDirectory": toNSNumber(NSAllLibrariesDirectory),
            @"NSTrashDirectory": toNSNumber(NSTrashDirectory)
        };

        NSDictionary *domainTypes = @{
            @"NSUserDomainMask": toNSNumber(NSUserDomainMask),
            @"NSLocalDomainMask": toNSNumber(NSLocalDomainMask),
            @"NSNetworkDomainMask": toNSNumber(NSNetworkDomainMask),
            @"NSSytemDomainMask": toNSNumber(NSSystemDomainMask),
            @"NSAllDomainMask": toNSNumber(NSAllDomainsMask)
        };

        for (NSString *dirTypeName in [dirTypes allKeys]) {
            NSNumber *dirTypeValue = [dirTypes objectForKey:dirTypeName];

            for (NSString *domainTypeName in [domainTypes allKeys]) {
                NSNumber *domainTypeValue = [domainTypes objectForKey:domainTypeName];

                NSArray *dirs = NSSearchPathForDirectoriesInDomains(toNSUInteger(dirTypeValue), toNSUInteger(domainTypeValue), YES);
                NSLog(@"%@ for %@:", dirTypeName, domainTypeName);
                NSLog(@"%@\n\n", dirs);
            }
        }
    }
    return 0;
}
