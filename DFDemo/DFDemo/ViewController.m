//
//  ViewController.m
//  DFDemo
//
//  Created by XiaobinLin on 2019/4/26.
//  ￼
#import "ViewController.h"
#import <DynamicApi/DynamicApi.h>

@implementation ViewController

- (IBAction)onButtonClick:(id)sender {
    Model *m = [DynamicApiA generateModel];
    NSLog(@"%@", m.title);
}

- (IBAction)onUnloadClick:(id)sender {
    [DynamicApiA unload];
}


@end
