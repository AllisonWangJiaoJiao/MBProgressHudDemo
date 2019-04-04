//
//  ViewController.m
//  MBProgressHudDemo
//
//  Created by allison on 2019/4/3.
//  Copyright © 2019 allison. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+Extension.h"
#import "BDFProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonClick:(UIButton *)sender {
    if (sender.tag == 10) {
//        [MBProgressHUD showSuccess:@"提示成功"];
        [BDFProgressHUD showMessage:@"提示信息！"];
    } else if (sender.tag == 20) {
//        [MBProgressHUD showError:@"提示错误"];
        [BDFProgressHUD showWaiting:@"正在等待"];
    } else if (sender.tag == 30) {
//        [MBProgressHUD showMessage:@"提示消息~"];
        [BDFProgressHUD showError:@"错误信息"];
    } else if (sender.tag == 40) {
//        [MBProgressHUD showWaiting];
//        [MBProgressHUD hideHUD];
        [BDFProgressHUD showSuccess:@"提示成功"];
    } else if (sender.tag == 50) {
//        [MBProgressHUD showLoading];
//        [MBProgressHUD hideHUD];
        [BDFProgressHUD showLoading:@"Loading..."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [BDFProgressHUD hideHUD];
        });
    } else if (sender.tag == 60) {
//        [MBProgressHUD showLoadingWithMessage:@"等待消息。。。"];
    } else if (sender.tag == 70) {
//        [MBProgressHUD showSaving];
    } else {
        
    }
}


@end
