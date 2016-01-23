//
//  DWKWebViewController.m
//  dynamicWebkit
//
//  Created by 圣迪 on 16/1/23.
//  Copyright © 2016年 com.test.cendy. All rights reserved.
//

#import "DWKWebViewController.h"
#import "Excalibur.h"

@interface DWKWebViewController ()

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) NSURL *url;

@end

@implementation DWKWebViewController

+ (void)load {
    if (iOSVersion < WK_WEBKIT_IOS_VERSION) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [Excalibur registerScheme:DWK_MODULE_WEB_VC forClass:[self class]];
        });
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[UIWebView alloc]initWithFrame:DEFAULT_FULL_SIZE_VIEW_RECT];
    [self.view addSubview:self.webView];
    [self loadRequest];
}

- (void)loadRequest {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.url];
    [self.webView loadRequest:request];
    
    [[[UIAlertView alloc] initWithTitle:@"UIWEBVIEW"
                                message:@"You are using UIWEBVIEW"
                               delegate:nil
                      cancelButtonTitle:@"ok"
                      otherButtonTitles:nil, nil]show];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DWKProtocol
+ (instancetype)webViewControllerForUrl:(NSURL *)url {
    DWKWebViewController *webVC = [[DWKWebViewController alloc] init];
    webVC.url = [url copy];
    return webVC;
}

@end
