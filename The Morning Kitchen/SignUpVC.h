//
//  SignUpVC.h
//  The Morning Kitchen
//
//  Created by deepak jain on 17/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpVC : UIViewController<UITextFieldDelegate>{
    IBOutlet UITextField *txtName;
    IBOutlet UITextField *txtAddress;
    IBOutlet UITextField *txtEmailId;
    IBOutlet UITextField *txtContactNo;
    IBOutlet UITextField *txtPassword;
    IBOutlet UITextField *txtReEnterPass;
    
    IBOutlet UILabel * lblSignupTitle;
    IBOutlet UILabel * lblName;
    IBOutlet UILabel * lblAddress;
    IBOutlet UILabel * lblEmail;
    IBOutlet UILabel * lblContact;
    IBOutlet UILabel * lblPassword;
    IBOutlet UILabel * lblReEnterPass;
    
    IBOutlet UILabel * lblNameTitle;
    IBOutlet UILabel * lblAddressTitle;
    IBOutlet UILabel * lblEmailTitle;
    IBOutlet UILabel * lblContactTitle;
    IBOutlet UILabel * lblPasswordTitle;
    IBOutlet UILabel * lblReEnterPassTitle;

    IBOutlet UIScrollView *scrollView;
    
    NSString *strCheckValue;
    
    IBOutlet UIButton *btnSignUpClicked;
    IBOutlet UIButton *btnTermConditionClicked;
    
    NSMutableArray *arrSignUp;
    
}
- (IBAction)btnSignUpAction:(id)sender;
- (IBAction)btnBackAction:(id)sender;
- (IBAction)btnCheckAction:(id)sender;

@end

