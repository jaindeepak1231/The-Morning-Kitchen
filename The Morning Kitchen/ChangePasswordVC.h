//
//  ChangePasswordVC.h
//  The Morning Kitchen
//
//  Created by deepak jain on 18/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePasswordVC : UIViewController <UITextFieldDelegate> {
    UILabel *lblCartListCount;
    IBOutlet UITextField *txtOldPassword;
    IBOutlet UITextField *txtNewPass;
    IBOutlet UITextField *txtReenterNewPass;
    
    IBOutlet UILabel * lblChangePassTitle;
    IBOutlet UILabel * lblOldPass;
    IBOutlet UILabel * lblNewPass;
    IBOutlet UILabel * lblReenterNewPass;
    
    IBOutlet UILabel * lblOldPassTitle;
    IBOutlet UILabel * lblNewPassTitle;
    IBOutlet UILabel * lblReenterNewPassTitle;
    
    
    IBOutlet UIButton *btnChangeClicked;
    
}
- (IBAction)btnChangeAction:(id)sender;

@end

