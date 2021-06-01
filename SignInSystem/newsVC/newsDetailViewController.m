//
//  newsDetailViewController.m
//  SignInSystem
//
//  Created by bytedance on 2021/5/12.
//

#import "newsDetailViewController.h"
#import "Webkit/Webkit.h"
@interface newsDetailViewController ()<WKNavigationDelegate>

@property (nonatomic,strong,readwrite) WKWebView *webView;

@end

@implementation newsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:({
        self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-88)];
        self.webView.navigationDelegate = self;
        self.webView;
    })];
    
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    
}
- (void)setUrlWithNSUrl:(NSURL *)url {
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    //[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.toutiao.com/w/a1699512555319310/?log_from=101efc2cf3828_1620787182930"]]];
}
@end
