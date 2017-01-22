//
//  ViewController.m
//  LittleHamster
//
//  Created by hongtao on 2017/1/22.
//  Copyright © 2017年 floodliu. All rights reserved.
//

#import "ViewController.h"
@import HealthKit;

@interface ViewController ()

@property HKHealthStore *healthStore;
@property HKQuantityType *stepsCountType;
@property (weak, nonatomic) IBOutlet UIButton *readerButton;
@property (weak, nonatomic) IBOutlet UIButton *writterButton;
@property (weak, nonatomic) IBOutlet UILabel *stepsCountLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.stepsCountType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    self.stepsCountLabel.text = 0;

    if ([HKHealthStore isHealthDataAvailable]) {
        NSLog(@"该设备支持HealthKit");
        self.healthStore = [[HKHealthStore alloc] init];
    } else {
        NSLog(@"该设备不支持HealthKit");
        self.healthStore = nil;
        exit(0);
    }

    [self requestAuthorizationForStepsCount];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestAuthorizationForStepsCount {
    NSSet<HKSampleType *> *shareTypes = [NSSet setWithObject:self.stepsCountType];
    NSSet<HKQuantityType *> *readTypes = [NSSet setWithObject:self.stepsCountType];

    [self.healthStore requestAuthorizationToShareTypes:shareTypes readTypes:readTypes completion:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            NSLog(@"成功获得HealthKit读写权限");
        } else {
            NSLog(@"未获得HealthKit读写权限");
            exit(0);
        }
    }];
}

- (IBAction)readStepsCount:(id)sender {
    [self setAllButtonsEnabled:NO];
    
    NSPredicate *predicate = [self createPredicate];
    HKStatisticsQuery *statisticsQuery = [[HKStatisticsQuery alloc] initWithQuantityType:self.stepsCountType quantitySamplePredicate:predicate options:HKStatisticsOptionCumulativeSum completionHandler:^(HKStatisticsQuery * _Nonnull query, HKStatistics * _Nullable result, NSError * _Nullable error) {
        if (result) {
            double totalSteps = [result.sumQuantity doubleValueForUnit:[HKUnit countUnit]];
            self.stepsCountLabel.text = [NSString stringWithFormat:@"%d", (int)totalSteps];
        }
        
        [self setAllButtonsEnabled:YES];
    }];
    
    [self.healthStore executeQuery:statisticsQuery];
}

- (void)setAllButtonsEnabled:(BOOL)enabled {
    [self.readerButton setEnabled:enabled];
    [self.writterButton setEnabled:enabled];
}

- (NSPredicate *)createPredicate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    NSDate *startDate = [calendar dateFromComponents:components];
    NSDate *endDate = [calendar dateByAddingUnit:NSCalendarUnitDay value:1 toDate:startDate options:0];
    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startDate endDate:endDate options:HKQueryOptionStrictStartDate];
    return predicate;
}

- (IBAction)writeStepsCount:(id)sender {
    [self setAllButtonsEnabled:NO];
    [self addStepsCount:1];
}

- (void)addStepsCount:(int)steps {
    HKQuantity *stepsQuantity = [HKQuantity quantityWithUnit:[HKUnit countUnit] doubleValue:steps];
    HKQuantitySample *stepsQuantitySampel = [HKQuantitySample quantitySampleWithType:self.stepsCountType quantity:stepsQuantity startDate:[NSDate date] endDate:[NSDate date]];
    [self.healthStore saveObject:stepsQuantitySampel withCompletion:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            [self readStepsCount:nil];
        }
    }];
}


@end
