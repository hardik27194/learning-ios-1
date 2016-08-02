//
//  BNREmployee.h
//  bnrPerson
//
//  Created by hongtao on 16/8/2.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import "BNRPerson.h"

@interface BNREmployee : BNRPerson

@property (nonatomic) unsigned int employeeId;
@property (nonatomic) unsigned int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;

- (double)yearsOfEmployment;

@end
