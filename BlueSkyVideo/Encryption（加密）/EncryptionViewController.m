//
//  EncryptionViewController.m
//  BlueSkyVideo
//
//  Created by 许菠菠 on 2018/3/23.
//  Copyright © 2018年 许菠菠. All rights reserved.
//

#import "EncryptionViewController.h"
#import "XVEncryption.h"

//#include "XVEncryption.h"
@interface EncryptionViewController ()

@end

@implementation EncryptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * password = @"xvbobo_123";
//    NSData * data = [XVEncryption AESEncryption:password];
//    NSLog(@"%@",data);
//    NSString * PSSWORD = [XVEncryption AESDecryption:data];
//    NSLog(@"%@",PSSWORD);
    NSString * dataString = [XVEncryption BaseEncryption:password];
    NSLog(@"%@",dataString);
    NSString * PASSWORD = [XVEncryption BaseDecryption:dataString];
    NSLog(@"%@",PASSWORD);
    NSString * nameMD5 = [XVEncryption MD5Encryption:@"张玲玲"];
    NSLog(@"nameMD5 = %@",nameMD5);

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
