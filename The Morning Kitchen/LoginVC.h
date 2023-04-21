//
//  LoginVC.h
//  The Morning Kitchen
//
//  Created by Saturncube on 17/01/17.
//  Copyright © 2017 Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Globel.h"

@interface LoginVC : UIViewController <UITextFieldDelegate> {
    IBOutlet UITextField *txtMobile;
    IBOutlet UITextField *txtPass;
    
    IBOutlet UIView *viewMobile;
    IBOutlet UIView *viewPass;
    
    IBOutlet UILabel *lblMobile;
    IBOutlet UILabel *lblPassword;
    
    IBOutlet UIButton *btnLoginClicked;
    IBOutlet UIButton *btnSignUpClicked;
    IBOutlet UIButton *btnForgotPassClicked;
    
    NSString * forgotPasswordAlertText;
}
- (IBAction)btnLoginAction:(id)sender;
- (IBAction)btnSignUpAction:(id)sender;
- (IBAction)btnForgotPassAction:(id)sender;


@end



