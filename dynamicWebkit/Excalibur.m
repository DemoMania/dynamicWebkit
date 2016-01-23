//
//  Excalibur.m
//  dynamicWebkit
//
//  Created by 圣迪 on 16/1/23.
//  Copyright © 2016年 com.test.cendy. All rights reserved.
//

#import "Excalibur.h"
#import <objc/runtime.h>
#import <objc/message.h>

static Excalibur *sharedInstance = nil;

@interface Excalibur ()

@property (nonatomic, strong) NSMapTable *mapTable;

@end

@implementation Excalibur

+ (void)initialize {
    [Excalibur sharedEXCCalibur];
}

+ (instancetype)sharedEXCCalibur {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        self.mapTable = [NSMapTable mapTableWithKeyOptions:NSMapTableStrongMemory
                                              valueOptions:NSMapTableWeakMemory];
    }
    return self;
}

- (void)addScheme:(nonnull NSString *)scheme forClass:(nonnull __unsafe_unretained Class)aClass {
    [self.mapTable setObject:aClass
                      forKey:[scheme stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
}

@end

#pragma mark - EXCRegister
@implementation Excalibur (ECBRegister)

+ (void)registerScheme:(nonnull NSString *)scheme
              forClass:(nonnull __unsafe_unretained Class)aClass {
    NSParameterAssert(scheme);
    NSParameterAssert(aClass);
    if ([Excalibur classForScheme:scheme]) {
        [NSException raise:@"Scheme Already Exists"
                    format:@"'%@' Scheme Already Exists", scheme];
        return;
    }
    if (![aClass isSubclassOfClass:[NSObject class]]) {
        [NSException raise:@"Wrong Class Type"
                    format:@"Class should inherit from NSObject"];
        return;
    }
    if ([scheme isEqualToString:@""]) {
        [NSException raise:@"Scheme Wrong"
                    format:@"Scheme should not be blank"];
        return;
    }
    [sharedInstance addScheme:scheme forClass:aClass];
}

@end

#pragma mark - ECBMapping
@implementation Excalibur (ECBMapping)

+ (nullable __unsafe_unretained Class)classForScheme:(nonnull NSString *)scheme {
    return [sharedInstance.mapTable objectForKey:scheme];
}

+ (nullable id)instanceForClassScheme:(nonnull NSString *)classScheme {
    Class aClass = [Excalibur classForScheme:classScheme];
    if (aClass) {
        id aInstance = [[aClass alloc] init];
        return aInstance;
    } else {
        return nil;
    }
}

@end