//
//  DWKProtocol.h
//  dynamicWebkit
//
//  Created by 圣迪 on 16/1/23.
//  Copyright © 2016年 com.test.cendy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DEVICE_FULL_SIZE_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define DEVICE_FULL_SIZE_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define DEFAULT_NAVIGATED_VIEW_TOP_INSET 64
#define NAVIGATED_VIEW_HEIGHT (DEVICE_FULL_SIZE_HEIGHT - DEFAULT_NAVIGATED_VIEW_TOP_INSET)
#define DEFAULT_NAVIGATED_VIEW_RECT CGRectMake(0, 0, DEVICE_FULL_SIZE_WIDTH, NAVIGATED_VIEW_HEIGHT)
#define DEFAULT_FULL_SIZE_VIEW_RECT CGRectMake(0, 0, DEVICE_FULL_SIZE_WIDTH, DEVICE_FULL_SIZE_HEIGHT)
#define iOSVersion [[[UIDevice currentDevice] systemVersion] floatValue]


#define DWK_MODULE_WEB_VC                @"dwk://module.web.vc"

/**
 *  WKWebView在哪个iOS 版本上开始使用
 */
#define WK_WEBKIT_IOS_VERSION 9.0

@protocol DWKProtocol <NSObject>

+ (instancetype)webViewControllerForUrl:(NSURL *)url;

@end
