//
//  BNRPerson.h
//  bnrPerson
//
//  Created by hongtao on 16/8/2.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRPerson : NSObject

{
    float _heightInMeters;
    int _weightInKilos;
}

- (float)heightInMeters;
- (void)setHeightInMeters:(float)height;
- (int)weightInKilos;
- (void)setWeightInKilos:(int)weight;

- (float)bodyMassIndex;  // 计算BMI

@end
