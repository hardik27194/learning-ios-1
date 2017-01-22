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

@property (weak, nonatomic) IBOutlet UILabel *stepsCountLabel;
@property (weak, nonatomic) IBOutlet UITextField *stepsCountInputter;
@property (weak, nonatomic) IBOutlet UIButton *writterButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *waitIndicator;
@property (weak, nonatomic) IBOutlet UILabel *waitLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.stepsCountType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if ([HKHealthStore isHealthDataAvailable]) {
        self.healthStore = [[HKHealthStore alloc] init];
    } else {
        self.healthStore = nil;
        NSString *title = @"提醒";
        NSString *message = @"您的设备不支持HealthKit，无法使用此应用。请按“确定”来退出。";
        [self showAlertViewWithTitle:title message:message];
    }
    
    [self requestAuthorizationForStepsCount];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        exit(0);
    }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)requestAuthorizationForStepsCount {
    NSSet<HKSampleType *> *shareTypes = [NSSet setWithObject:self.stepsCountType];
    NSSet<HKQuantityType *> *readTypes = [NSSet setWithObject:self.stepsCountType];

    [self.healthStore requestAuthorizationToShareTypes:shareTypes readTypes:readTypes completion:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            [self readStepsCount:YES];
        } else {
            NSString *title = @"提醒";
            NSString *message = @"未能获得HealthKit权限，无法使用此应用。请按“确定”来退出。";
            [self showAlertViewWithTitle:title message:message];
        }
    }];
}

- (void)readStepsCount:(BOOL)showWaitIndicator {
    [self enableUserInput:NO];
    if (showWaitIndicator) {
        [self showWaitIndicatorAndLabel:YES];
    }
    
    NSPredicate *predicate = [self createPredicate];
    HKStatisticsQuery *statisticsQuery = [[HKStatisticsQuery alloc] initWithQuantityType:self.stepsCountType quantitySamplePredicate:predicate options:HKStatisticsOptionCumulativeSum completionHandler:^(HKStatisticsQuery * _Nonnull query, HKStatistics * _Nullable result, NSError * _Nullable error) {
        if (result) {
            double totalSteps = [result.sumQuantity doubleValueForUnit:[HKUnit countUnit]];
            self.stepsCountLabel.text = [NSString stringWithFormat:@"%d", (int)totalSteps];
        }
        
        [self showWaitIndicatorAndLabel:NO];
        [self enableUserInput:YES];
    }];
    
    [self.healthStore executeQuery:statisticsQuery];
}

- (void)enableUserInput:(BOOL)enabled {
    [self.stepsCountInputter setEnabled:enabled];
    [self.writterButton setEnabled:enabled];
}

- (void)showWaitIndicatorAndLabel:(BOOL)show {
    if (show) {
        [self.waitLabel setHidden:NO];
        
        if ([self.waitIndicator isAnimating]) {
            [self.waitIndicator stopAnimating];
        }
        [self.waitIndicator startAnimating];
    } else {
        [self.waitLabel setHidden:YES];
        
        if ([self.waitIndicator isAnimating]) {
            [self.waitIndicator stopAnimating];
        }
    }
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
    int stepsToAdd = (int)[self.stepsCountInputter.text doubleValue];
    if (stepsToAdd > 0) {
        [self enableUserInput:NO];
        self.waitLabel.text = @"正在写入数据……";
        [self showWaitIndicatorAndLabel:YES];
        
        [self addStepsCount:stepsToAdd];
    }
}

- (void)addStepsCount:(int)steps {
    HKQuantity *stepsQuantity = [HKQuantity quantityWithUnit:[HKUnit countUnit] doubleValue:steps];
    HKQuantitySample *stepsQuantitySampel = [HKQuantitySample quantitySampleWithType:self.stepsCountType quantity:stepsQuantity startDate:[NSDate date] endDate:[NSDate date]];
    [self.healthStore saveObject:stepsQuantitySampel withCompletion:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            [self readStepsCount:NO];
        } else {
            [self showWaitIndicatorAndLabel:NO];
            [self enableUserInput:YES];
        }
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.stepsCountInputter resignFirstResponder];
}

@end
