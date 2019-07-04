//
//  ViewController.m
//  YTK
//
//  Created by wang on 2019/7/4.
//  Copyright © 2019 wang. All rights reserved.
//

#import "ViewController.h"
#import "YTKNet/LoginApi.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)loginBtnClick:(id)sender {
//    @"code" : @"884985",
//    @"device_token" : @"9df4cea7dc3b6b41bc0200d8257aa9e3b435f2e282a599501337575983e096d9"
    LoginApi *login = [[LoginApi alloc] initWithParm:@{@"mobile" : @"18618400540",
                                                       
                                                       } type:(URLAPITypeLogin)];
    [login startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}
- (IBAction)homeBtnClick:(id)sender {
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    LoginApi *login = [[LoginApi alloc] initWithParm:@{}];
//    if ([login loadCacheWithError:nil]) {
//         NSDictionary *json = [login responseJSONObject];
//    }
//    [login startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
//
//    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
//
//    }];
//
//}


@end
