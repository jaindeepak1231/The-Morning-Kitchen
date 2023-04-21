//
//  VerificationVC.h
//  The Morning Kitchen
//
//  Created by deepak jain on 17/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VerificationVC : UIViewController <UITextFieldDelegate>{
    IBOutlet UITextField *txtOTP;
    
    IBOutlet UIView * viewOTP;
    IBOutlet UIButton *btnSubmitClicked;
    
}
@property (nonatomic, strong)NSString *strOTP;
- (IBAction)btnSubmitAction:(id)sender;
- (IBAction)btnBackAction:(id)sender;


@end
