//
//  Excalibur.h
//  dynamicWebkit
//
//  Created by 圣迪 on 16/1/23.
//  Copyright © 2016年 com.test.cendy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Excalibur : NSObject

@end

@interface Excalibur (ECBRegister)

+ (void)registerScheme:(nonnull NSString *)scheme
              forClass:(nonnull __unsafe_unretained Class)aClass;

@end

@interface Excalibur (ECBMapping)

+ (nullable __unsafe_unretained Class)classForScheme:(nonnull NSString *)scheme;
+ (nullable id)instanceForClassScheme:(nonnull NSString *)classScheme;

@end