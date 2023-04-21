//
//  SignUpVC.m
//  The Morning Kitchen
//
//  Created by deepak jain on 17/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "SignUpVC.h"
#import "Globel.h"


@interface SignUpVC ()

@end

@implementation SignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    arrSignUp = [[NSMutableArray alloc]init];
    self.view.backgroundColor = GET_COLOR_WITH_RGB(117, 82, 133, 1);
    
    lblSignupTitle.textColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblName.backgroundColor = underlineColor;
    lblAddress.backgroundColor = underlineColor;
    lblEmail.backgroundColor = underlineColor;
    lblContact.backgroundColor = underlineColor;
    lblPassword.backgroundColor = underlineColor;
    lblReEnterPass.backgroundColor = underlineColor;
    
    
    UIColor * TitleColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblNameTitle.textColor = TitleColor;
    lblAddressTitle.textColor = TitleColor;
    lblEmailTitle.textColor = TitleColor;
    lblContactTitle.textColor = TitleColor;
    lblPasswordTitle.textColor = TitleColor;
    lblReEnterPassTitle.textColor = TitleColor;
    btnSignUpClicked.backgroundColor = TitleColor;
    [btnSignUpClicked setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    lblNameTitle.hidden = YES;
    lblAddressTitle.hidden = YES;
    lblEmailTitle.hidden = YES;
    lblContactTitle.hidden = YES;
    lblPasswordTitle.hidden = YES;
    lblReEnterPassTitle.hidden = YES;
    [txtName addTarget:self action:@selector(txtNameData) forControlEvents:UIControlEventEditingChanged];
    [txtAddress addTarget:self action:@selector(txtAddressData) forControlEvents:UIControlEventEditingChanged];
    [txtEmailId addTarget:self action:@selector(txtEmailData) forControlEvents:UIControlEventEditingChanged];
    [txtContactNo addTarget:self action:@selector(txtContactData) forControlEvents:UIControlEventEditingChanged];
    [txtPassword addTarget:self action:@selector(txtPasswordData) forControlEvents:UIControlEventEditingChanged];
    [txtReEnterPass addTarget:self action:@selector(txtRePassData) forControlEvents:UIControlEventEditingChanged];
    
    
    UIColor *color = [UIColor whiteColor];
    txtName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Name" attributes:@{NSForegroundColorAttributeName: color}];
    
    txtAddress.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Address" attributes:@{NSForegroundColorAttributeName: color}];
    
    txtEmailId.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email Id" attributes:@{NSForegroundColorAttributeName: color}];
    
    txtContactNo.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Contact No." attributes:@{NSForegroundColorAttributeName: color}];
    
    txtPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: color}];
    
    txtReEnterPass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Re-enter Password" attributes:@{NSForegroundColorAttributeName: color}];
    
    NSString *strTerms = [NSString stringWithFormat:@"<p style='font-size:16px;color:rgb(246,194,93);'>I have read <span style='font-size:16px;color:rgb(117,82,133);border-bottom:1px solid rgb(117,82,133);'>Privacy policy</span> & <span style='color:rgb(117,82,133);border-bottom:1px solid rgb(117,82,133);'>Terms of use</span></p>"];
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData: [strTerms dataUsingEncoding:NSUnicodeStringEncoding] options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes: nil error: nil];
    [btnTermConditionClicked setAttributedTitle:attributedString forState:UIControlStateNormal];
    
    [btnTermConditionClicked.titleLabel setFont:[UIFont systemFontOfSize:15]];
   // btnSignUpClicked.attributedText=attributedString;
   // btnSignUpClicked.font = [UIFont systemFontOfSize:14];
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, 610);
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark text field delegate
#pragma mark - TextField Delegate Methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField==txtName) {
        [textField resignFirstResponder];
        [txtAddress becomeFirstResponder];
        return NO;
    }
    if (textField==txtAddress) {
        [textField resignFirstResponder];
        [txtEmailId becomeFirstResponder];
        return NO;
    }
    if (textField==txtEmailId) {
        [textField resignFirstResponder];
        [txtContactNo becomeFirstResponder];
        return NO;
    }
    if (textField==txtContactNo) {
        [textField resignFirstResponder];
        [txtPassword becomeFirstResponder];
        return NO;
    }
    if (textField==txtPassword) {
        [textField resignFirstResponder];
        [txtReEnterPass becomeFirstResponder];
        return NO;
    }
    [textField resignFirstResponder];
    return YES;
}

-(void)txtNameData {
    if ([txtName.text isEqualToString:@""]) {
        lblNameTitle.hidden = YES;
    }
    else {
        lblNameTitle.hidden = NO;
    }
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblName.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblAddress.backgroundColor = underlineColor;
    lblEmail.backgroundColor = underlineColor;
    lblContact.backgroundColor = underlineColor;
    lblPassword.backgroundColor = underlineColor;
    lblReEnterPass.backgroundColor = underlineColor;
}

-(void)txtAddressData {
    if ([txtAddress.text isEqualToString:@""]) {
        lblAddressTitle.hidden = YES;
    }
    else {
        lblAddressTitle.hidden = NO;
    }
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblName.backgroundColor = underlineColor;
    lblAddress.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblEmail.backgroundColor = underlineColor;
    lblContact.backgroundColor = underlineColor;
    lblPassword.backgroundColor = underlineColor;
    lblReEnterPass.backgroundColor = underlineColor;
}

-(void)txtEmailData {
    if ([txtEmailId.text isEqualToString:@""]) {
        lblEmailTitle.hidden = YES;
    }
    else {
        lblEmailTitle.hidden = NO;
    }
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblName.backgroundColor = underlineColor;
    lblAddress.backgroundColor = underlineColor;
    lblEmail.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblContact.backgroundColor = underlineColor;
    lblPassword.backgroundColor = underlineColor;
    lblReEnterPass.backgroundColor = underlineColor;
}

-(void)txtContactData {
    if ([txtContactNo.text isEqualToString:@""]) {
        lblContactTitle.hidden = YES;
    }
    else {
        lblContactTitle.hidden = NO;
    }
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblName.backgroundColor = underlineColor;
    lblAddress.backgroundColor = underlineColor;
    lblEmail.backgroundColor = underlineColor;
    lblContact.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblPassword.backgroundColor = underlineColor;
    lblReEnterPass.backgroundColor = underlineColor;
}

-(void)txtPasswordData {
    if ([txtPassword.text isEqualToString:@""]) {
        lblPasswordTitle.hidden = YES;
    }
    else {
        lblPasswordTitle.hidden = NO;
    }
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblName.backgroundColor = underlineColor;
    lblAddress.backgroundColor = underlineColor;
    lblEmail.backgroundColor = underlineColor;
    lblContact.backgroundColor = underlineColor;
    lblPassword.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblReEnterPass.backgroundColor = underlineColor;
}

-(void)txtRePassData {
    if ([txtReEnterPass.text isEqualToString:@""]) {
        lblReEnterPassTitle.hidden = YES;
    }
    else {
        lblReEnterPassTitle.hidden = NO;
    }
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblName.backgroundColor = underlineColor;
    lblAddress.backgroundColor = underlineColor;
    lblEmail.backgroundColor = underlineColor;
    lblContact.backgroundColor = underlineColor;
    lblPassword.backgroundColor = underlineColor;
    lblReEnterPass.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
}


#pragma mark - Action Methods

- (IBAction)btnBackAction:(id)sender {
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (IBAction)btnCheckAction:(id)sender {
    UIButton *tappedButton = (UIButton*)sender;
    if([tappedButton.currentImage isEqual:[UIImage imageNamed:@"uncheck"]]) {
        [sender  setImage:[UIImage imageNamed: @"check"] forState:UIControlStateNormal];
        strCheckValue = @"Hello";
    } else {
        [sender setImage:[UIImage imageNamed:@"uncheck"]forState:UIControlStateNormal];
        strCheckValue = @"";
    }
    NSLog(@"%@", strCheckValue);
}

- (IBAction)btnTermsConditionAction:(id)sender {
    NSString*strURL=[NSString stringWithFormat:PrivacyPolicy];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strURL]];
}

- (IBAction)btnSignUpAction:(id)sender {
    [self.view endEditing:YES];
    if ([txtName.text isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please enter name" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    else if ([txtAddress.text isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please enter address" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    else if ([txtEmailId.text isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please enter email" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    else if (![APP_DELEGATE validateEmail:txtEmailId.text]) {
        [self.navigationController.view makeToast:@"Please enter correct email" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    else if ([txtContactNo.text isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please enter contact no" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    else if ([txtPassword.text isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please enter password" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    else if ([txtReEnterPass.text isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please Re-enter password" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    else if (![txtReEnterPass.text isEqualToString:txtPassword.text]) {
        [self.navigationController.view makeToast:@"Password doesn't match" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    
    else if (![strCheckValue isEqualToString:@"Hello"]) {
        [self.navigationController.view makeToast:@"Please accept Terms & Condition" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    
    if(appDelegate.isInternetAvailable) {
        [appDelegate startLoadingview:@"Loading..."];
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForRegisterUser) userInfo:nil repeats:NO];
    }else{
        [appDelegate stopLoadingView];
        showAlert(@"Check Connection", AlertInternet);
    }
}


#pragma mark - Post Data To Server
-(void)postDataOnWebserviceForRegisterUser{
    NSString *urlString = [NSString stringWithFormat:@"%@add_user.php?", MainURL];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.delegate = self;
    [request setRequestMethod:@"POST"];
    [request setPostValue:txtName.text forKey:@"name"];
    [request setPostValue:txtAddress.text forKey:@"address"];
    [request setPostValue:txtEmailId.text forKey:@"emailid"];
    [request setPostValue:txtContactNo.text forKey:@"mobileno"];
    [request setPostValue:txtPassword.text forKey:@"password"];
    [request setDidFinishSelector:@selector(checkupdateFinished:)];
    [request setDidFailSelector:@selector(checkupdateFailed:)];
    [request startSynchronous];
}

-(void)checkupdateFinished:(ASIFormDataRequest *)request {
    NSString *receivedString = [request responseString];
    NSLog(@"aa:->%@",receivedString);
    if (request.responseData) {
        NSError *error;
        arrSignUp = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
        NSLog(@"%@",arrSignUp);
        
        NSString *strSatus = [NSString stringWithFormat:@"%@",[[arrSignUp objectAtIndex:0]valueForKey:@"status"]];
        if ([strSatus isEqualToString:@"1"]) {
            NSString *strOTP = [NSString stringWithFormat:@"%@",[[arrSignUp objectAtIndex:1]valueForKey:@"OTP"]];
            
            NSString *struserID = [NSString stringWithFormat:@"%@",[[arrSignUp objectAtIndex:1]valueForKey:@"userid"]];
            
            NSLog(@"%@", strOTP);
            NSLog(@"%@", struserID);
            
            UIStoryboard *storyboard = self.storyboard;
            VerificationVC *loginObj =
            [storyboard instantiateViewControllerWithIdentifier:@"VerificationVC"];
            loginObj.strOTP = strOTP;
            [self.navigationController pushViewController:loginObj animated:YES];
            [APP_DELEGATE stopLoadingView];
        }
        else {
            [self.navigationController.view makeToast:@"Mobile no already exists!!" duration:3.0 position:CSToastPositionBottom];
        }
    }
    [APP_DELEGATE stopLoadingView];
}

-(void)checkupdateFailed:(ASIFormDataRequest *)request {
    [APP_DELEGATE stopLoadingView];
    NSString *receivedString = [request responseString];
    NSLog(@"Error:%@", receivedString);
    //UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Temporary server is down. Please try again." message:receivedString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    //[alertView show];
}



@end

