//
//  VerificationVC.m
//  The Morning Kitchen
//
//  Created by deepak jain on 17/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "VerificationVC.h"
#import "Globel.h"

@interface VerificationVC ()

@end

@implementation VerificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = GET_COLOR_WITH_RGB(117, 82, 133, 1);
    
    btnSubmitClicked.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    [btnSubmitClicked setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    viewOTP.backgroundColor = [UIColor whiteColor];
    
    UIColor *color = [UIColor darkGrayColor];
    txtOTP.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter OTP" attributes:@{NSForegroundColorAttributeName: color}];
    txtOTP.textColor = [UIColor darkGrayColor];
}


- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:YES];
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
- (IBAction)btnSubmitAction:(id)sender {
    [self.view endEditing:YES];
    if ([txtOTP.text isEqualToString:self.strOTP]) {
        UIStoryboard *storyboard = self.storyboard;
        LoginVC *loginObj =
        [storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
        [self.navigationController pushViewController:loginObj animated:YES];
    }
    else {
        [self.navigationController.view makeToast:@"Please enter valid OTP!!" duration:3.0 position:CSToastPositionBottom];
    }
    
}

- (IBAction)btnBackAction:(id)sender {
    
}

@end
