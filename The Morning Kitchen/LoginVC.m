//
//  LoginVC.m
//  The Morning Kitchen
//
//  Created by Saturncube on 17/01/17.
//  Copyright © 2017 Saturncube. All rights reserved.
//

#import "LoginVC.h"
#import "Globel.h"


@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = GET_COLOR_WITH_RGB(117, 82, 133, 1);
    
    viewMobile.backgroundColor = GET_COLOR_WITH_RGB(99, 19, 98, 1);
    viewPass.backgroundColor = GET_COLOR_WITH_RGB(99, 19, 98, 1);
    
    btnLoginClicked.backgroundColor = GET_COLOR_WITH_RGB(69, 11, 70, 1);
    btnSignUpClicked.backgroundColor = GET_COLOR_WITH_RGB(69, 11, 70, 1);
    
    [btnLoginClicked setTitleColor:GET_COLOR_WITH_RGB(238, 121, 0, 1) forState:UIControlStateNormal];
    [btnSignUpClicked setTitleColor:GET_COLOR_WITH_RGB(238, 121, 0, 1) forState:UIControlStateNormal];
    lblMobile.textColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblPassword.textColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    
    UIColor *color = [UIColor whiteColor];
    txtMobile.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Mobile No" attributes:@{NSForegroundColorAttributeName: color}];
    txtMobile.textColor = color;
    txtPass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];
    txtPass.textColor = color;
    
    
    APP_DELEGATE.activity.frame =CGRectMake(150  , 142, 20, 20);
    [self.view addSubview:APP_DELEGATE.activity];
    lblMobile.hidden = YES;
    lblPassword.hidden=YES;
    [txtMobile addTarget:self action:@selector(txtMobileData) forControlEvents:UIControlEventEditingChanged];
    [txtPass addTarget:self action:@selector(txtPasswordData) forControlEvents:UIControlEventEditingChanged];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:YES];
    txtMobile.text=@"";
    txtPass.text=@"";
    lblMobile.hidden = YES;
    lblPassword.hidden=YES;
    NSString*strUDID =  [NSString stringWithFormat:@"%@",[OpenUDID value]];
    NSLog(@"%@", strUDID);
}

#pragma mark - TextField Delegate Methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField==txtMobile) {
        [textField resignFirstResponder];
        [txtPass becomeFirstResponder];
        return NO;
    }
    [textField resignFirstResponder];
    return YES;
}

-(void)txtMobileData {
    if ([txtMobile.text isEqualToString:@""]) {
        lblMobile.hidden = YES;
        txtMobile.frame = CGRectMake(txtMobile.frame.origin.x, 7, txtMobile.frame.size.width, txtMobile.frame.size.height);
    }
    else {
        lblMobile.hidden = NO;
        txtMobile.frame = CGRectMake(txtMobile.frame.origin.x, 17, txtMobile.frame.size.width, txtMobile.frame.size.height);
    }
}

-(void)txtPasswordData {
    if ([txtPass.text isEqualToString:@""]) {
        lblPassword.hidden = YES;
        txtPass.frame = CGRectMake(txtPass.frame.origin.x, 7, txtPass.frame.size.width, txtPass.frame.size.height);
    }
    else {
        lblPassword.hidden = NO;
        txtPass.frame = CGRectMake(txtPass.frame.origin.x, 17, txtPass.frame.size.width, txtPass.frame.size.height);
    }
}

- (IBAction)btnSignUpAction:(id)sender {
    [self.view endEditing:YES];
    UIStoryboard *storyboard = self.storyboard;
    SignUpVC *loginObj =
    [storyboard instantiateViewControllerWithIdentifier:@"SignUpVC"];
    [self.navigationController pushViewController:loginObj animated:YES];
}


- (IBAction)btnLoginAction:(id)sender {
    [self.view endEditing:YES];
    if ([txtMobile.text isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please enter mobile no" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    else if ([txtPass.text isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please enter password" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    
    if(appDelegate.isInternetAvailable) {
        [appDelegate startLoadingview:@"Loading..."];
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(postDataOnWebserviceForLogin) userInfo:nil repeats:NO];
    }else{
        [appDelegate stopLoadingView];
        showAlert(@"Check Connection", AlertInternet);
    }
}


#pragma mark - Post Data To Server
-(void)postDataOnWebserviceForLogin {
    NSString *urlString = [NSString stringWithFormat:@"%@user_login.php?", MainURL];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.delegate = self;
    [request setRequestMethod:@"POST"];
    [request setPostValue:txtMobile.text forKey:@"mobileno"];
    [request setPostValue:txtPass.text forKey:@"password"];
    request.tag = loginUrlTag;
    [request setDidFinishSelector:@selector(checkupdateFinished:)];
    [request setDidFailSelector:@selector(checkupdateFailed:)];
    [request startSynchronous];
}


-(void)checkupdateFinished:(ASIFormDataRequest *)request {
    NSString *receivedString = [request responseString];
    NSLog(@"aa:->%@",receivedString);
    if (request.responseData) {
        
        if (request.tag == forgotPassURLTag) {
            
            NSError *error;
            NSMutableArray*arrForgot = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
            NSLog(@"%@",arrForgot);
            
            NSString *strSatus = [NSString stringWithFormat:@"%@",[[arrForgot objectAtIndex:0]valueForKey:@"status"]];
            if ([strSatus isEqualToString:@"1"]) {
                [self.navigationController.view makeToast:@"Please check mail" duration:3.0 position:CSToastPositionBottom];
                
                [APP_DELEGATE stopLoadingView];
            }
            else {
                [self.navigationController.view makeToast:@"Please try again" duration:3.0 position:CSToastPositionBottom];
            }
            
        }
        
        
        if (request.tag == loginUrlTag) {
            NSError *err;
            NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:request.responseData options:kNilOptions error:&err];
            NSLog(@"Result Dictionary :->%@",resultDict);
            NSString *strStatus=[NSString stringWithFormat:@"%@",[resultDict valueForKey:@"status"]];
            strStatus = [[strStatus description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"()"]];
            strStatus = [strStatus stringByReplacingOccurrencesOfString:@" " withString:@""];
            strStatus = [strStatus stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            
            if ([strStatus isEqualToString:@"0"]) {
                [self.navigationController.view makeToast:@"Invalid Mobile no or Password" duration:3.0 position:CSToastPositionBottom];
            }
            else if ([strStatus isEqualToString:@"1"]) {
                
                NSString *struser_id=[NSString stringWithFormat:@"%@",[resultDict valueForKey:@"user_id"]];
                struser_id = [[struser_id description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"()"]];
                struser_id = [struser_id stringByReplacingOccurrencesOfString:@" " withString:@""];
                struser_id = [struser_id stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                
                NSString *struser_name=[NSString stringWithFormat:@"%@",[resultDict valueForKey:@"user_name"]];
                struser_name = [[struser_name description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"()"]];
                struser_name = [struser_name stringByReplacingOccurrencesOfString:@" " withString:@""];
                struser_name = [struser_name stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                
                [USERDEFAULT setObject:struser_id forKey:@"user_id"];
                [USERDEFAULT setObject:struser_name forKey:@"user_name"];
                [USERDEFAULT setBool:YES forKey:@"login"];
                
                UIStoryboard *storyboard = self.storyboard;
                HomeVC *loginObj =
                [storyboard instantiateViewControllerWithIdentifier:@"HomeVC"];
                [self.navigationController pushViewController:loginObj animated:YES];
                [APP_DELEGATE stopLoadingView];
            }
        }
        [APP_DELEGATE stopAnimating];
        [APP_DELEGATE stopLoadingView];
    }
}

-(void)checkupdateFailed:(ASIFormDataRequest *)request {
    //  [SVProgressHUD dismiss];
    [APP_DELEGATE stopAnimating];
    [APP_DELEGATE stopLoadingView];
    NSString *receivedString = [request responseString];
    NSLog(@"Error:%@", receivedString);
    //UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Temporary server is down. Please try again." message:receivedString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    //[alertView show];
}



- (IBAction)btnForgotPassAction:(id)sender {
    UIAlertView * altView = [[UIAlertView alloc] initWithTitle:@"Forgot Password?" message:@"Please enter your email address." delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil];
    altView.tag = 101;
    [altView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [altView textFieldAtIndex:0].placeholder = @"Email Address";
    [altView textFieldAtIndex:0].keyboardType = UIKeyboardTypeEmailAddress;
    [altView textFieldAtIndex:0].returnKeyType = UIReturnKeyDone;
    [altView textFieldAtIndex:0].text = forgotPasswordAlertText;
    [altView show];
}



#pragma mark - AlertView Delegate Methods
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (alertView.tag)
    {
            
            //101 tag for forgot password
        case 101:
            switch (buttonIndex)
        {
            case 1:
                forgotPasswordAlertText = [alertView textFieldAtIndex:0].text;
                if ([forgotPasswordAlertText isEqualToString:@""]) {
                    [self.navigationController.view makeToast:@"Please enter email" duration:3.0 position:CSToastPositionBottom];
                }
                else if (![APP_DELEGATE validateEmail:forgotPasswordAlertText]) {
                    [self.navigationController.view makeToast:@"Please enter correct email" duration:3.0 position:CSToastPositionBottom];
                }
                else {
                    if(appDelegate.isInternetAvailable) {
                        [appDelegate startLoadingview:@"Loading..."];
                        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForForgotPassword) userInfo:nil repeats:NO];
                    }else{
                        [appDelegate stopLoadingView];
                        showAlert(@"Check Connection", AlertInternet);
                    }
                }
                break;
            default:
                break;
        }
            break;
            //102 tag for reopen forgot password alert
        case 102:
            
        default:
            break;
    }
}

#pragma mark - Post Data To Server
-(void)postDataOnWebserviceForForgotPassword {
    NSString *urlString = [NSString stringWithFormat:@"%@forgot_password.php?", MainURL];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.delegate = self;
    [request setRequestMethod:@"POST"];
    [request setPostValue:forgotPasswordAlertText forKey:@"emailid"];
    request.tag = forgotPassURLTag;
    [request setDidFinishSelector:@selector(checkupdateFinished:)];
    [request setDidFailSelector:@selector(checkupdateFailed:)];
    [request startSynchronous];
}

@end


