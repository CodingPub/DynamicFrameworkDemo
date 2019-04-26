//
//  Test.m
//  DFDemo
//
//  Created by XiaobinLin on 2019/4/26.
//

#import "Test.h"
#import <DynamicApi/DynamicApi.h>

@implementation Test

- (void)test {
    Model *m = [DynamicApiA generateModel];
    NSLog(@"%@", m.title);
}

@end
