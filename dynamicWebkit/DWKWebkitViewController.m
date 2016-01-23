//
//  DWKWebkitViewController.m
//  dynamicWebkit
//
//  Created by 圣迪 on 16/1/23.
//  Copyright © 2016年 com.test.cendy. All rights reserved.
//

#import "DWKWebkitViewController.h"
#import "Excalibur.h"
@import WebKit;

@interface DWKWebkitViewController ()

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) NSURL *url;

@end

@implementation DWKWebkitViewController

+ (void)load {
    if (iOSVersion >= WK_WEBKIT_IOS_VERSION) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [Excalibur registerScheme:DWK_MODULE_WEB_VC forClass:[self class]];
        });
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[WKWebView alloc] initWithFrame:DEFAULT_FULL_SIZE_VIEW_RECT];
    [self.view addSubview:self.webView];
    
    [self loadRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadRequest {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.url];
    [self.webView loadRequest:request];
    [[[UIAlertView alloc] initWithTitle:@"WKWebkit"
                               message:@"You are using WKWebkit"
                              delegate:nil
                     cancelButtonTitle:@"ok"
                      otherButtonTitles:nil, nil]show];
}

#pragma mark - DWKProtocol
+ (instancetype)webViewControllerForUrl:(NSURL *)url {
    DWKWebkitViewController *webVC = [[DWKWebkitViewController alloc] init];
    webVC.url = [url copy];
    return webVC;
}

@end
