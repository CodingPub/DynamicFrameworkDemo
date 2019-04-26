//
//  DynamicImpA.m
//  DynamicImp
//
//  Created by XiaobinLin on 2019/4/26.
//  ￼
#import "DynamicImpA.h"

@implementation DynamicImpA

+ (void)load {
    //测试动态库是否被自动加载
    NSLog(@"DynamicImpA load");
}

+ (Model *)generateModel {
    NSLog(@"%@ generateModel", self);
    
    Model *m = [[Model alloc] init];
    m.title = @"Hello dynamic";
    return m;
}

@end
