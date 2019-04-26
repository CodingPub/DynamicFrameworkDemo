//
//  DynamicApiA.m
//  DynamicApi
//
//  Created by XiaobinLin on 2019/4/26.
//  ￼
#import "DynamicApiA.h"

static NSBundle *sDynamicBundle = nil;

@interface DynamicApiA()

@end

@implementation DynamicApiA

// 调用动态库中的类
+ (Model *)generateModel {
    return [[self impl] generateModel];
}

+ (void)unload {
    if (sDynamicBundle) {
        [sDynamicBundle unload];
        sDynamicBundle = nil;
        NSLog(@"did unload");
    }
    
    Class cls = NSClassFromString(@"DynamicImpA");
    NSLog(@"DynamicImpA: %@", cls);
}

// 返回动态库中的类
+ (id<DynamicApi>)impl {
    if (![self loadFramework:@"DynamicImp.framework"]) {
        return nil;
    }
    
    Class cls = NSClassFromString(@"DynamicImpA");
    if (cls && [cls conformsToProtocol:@protocol(DynamicApi)]) {
        return (id<DynamicApi>)cls;
    }
    
    return nil;
}

// 加载动态库
+ (BOOL)loadFramework:(NSString *)frameworkName {
    if (sDynamicBundle) {
        return YES;
    }
    
    NSString *path = [NSString stringWithFormat:@"%@/%@", [NSBundle mainBundle].privateFrameworksPath, frameworkName];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    if (!bundle) {
        NSLog(@"%@ not found", frameworkName);
        return NO;
    }
    
    sDynamicBundle = bundle;
    
    NSError *error;
    if (![bundle loadAndReturnError:&error]) {
        NSLog(@"Load %@ failed: %@", frameworkName, error);
        return NO;
    } else {
        NSLog(@"Load %@ success", frameworkName);
    }
    
    return YES;
}

@end
