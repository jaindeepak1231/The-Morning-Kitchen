//
//  ChangePasswordVC.m
//  The Morning Kitchen
//
//  Created by deepak jain on 18/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "ChangePasswordVC.h"
#import "Globel.h"

@interface ChangePasswordVC ()

@end

@implementation ChangePasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //--------------------Set Navigation Bar-------------------//
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 20)];
    UIView *NavView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width, 50)];
    statusBarView.backgroundColor = GET_COLOR_WITH_RGB(117, 82, 133, 1);
    NavView.backgroundColor = GET_COLOR_WITH_RGB(96, 65, 110, 1);
    
    UIButton *homeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [homeBtn setImage:[UIImage imageNamed:@"homeicon"] forState:UIControlStateNormal];
    [homeBtn setImage:[UIImage imageNamed:@"homeicon"] forState:UIControlStateHighlighted];
    homeBtn.frame = CGRectMake(0, 0, 55, 55);
    [homeBtn addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleLeftMenu) forControlEvents:UIControlEventTouchUpInside];
    [NavView addSubview:homeBtn];
    
    UIButton *Btncart = [UIButton buttonWithType:UIButtonTypeCustom];
    [Btncart setImage:[UIImage imageNamed:@"cart-1"] forState:UIControlStateNormal];
    [Btncart setImage:[UIImage imageNamed:@"cart-1"] forState:UIControlStateHighlighted];
    Btncart.frame = CGRectMake(self.view.frame.size.width-55, 0, 55, 55);
    [Btncart addTarget:self action:@selector(btnCartListTapped:) forControlEvents:UIControlEventTouchUpInside];
    [NavView addSubview:Btncart];
    
    lblCartListCount = [[UILabel alloc]init];
    lblCartListCount.frame = CGRectMake(self.view.frame.size.width-32, 5, 25, 25);
    lblCartListCount.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblCartListCount.textColor = [UIColor whiteColor];
    lblCartListCount.textAlignment = NSTextAlignmentCenter;
    [lblCartListCount setFont:[UIFont systemFontOfSize:13]];
    lblCartListCount.text = @"";
    lblCartListCount.layer.cornerRadius=lblCartListCount.frame.size.width/2;
    lblCartListCount.layer.masksToBounds=TRUE;
    
    if ([lblCartListCount.text isEqualToString:@""]) {
        lblCartListCount.hidden = YES;
    }
    else {
        lblCartListCount.hidden = NO;
    }
    
    
    [NavView addSubview:lblCartListCount];
    
    
    UILabel *Title_lb = [[UILabel alloc] initWithFrame:CGRectMake(55, 5,200, 44)];
    [Title_lb setText:@"The Morning Kitchen"];
    Title_lb.textAlignment = NSTextAlignmentLeft;
    [Title_lb setTextColor:[UIColor whiteColor]];
    [Title_lb setFont:[UIFont fontWithName:FontName size:15.0]];
    [Title_lb setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin];
    
    [NavView addSubview:Title_lb];
    
    [self.view addSubview:statusBarView];
    [self.view addSubview:NavView];
    
    
    
    
    self.view.backgroundColor = GET_COLOR_WITH_RGB(117, 82, 133, 1);
    
    lblChangePassTitle.textColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblOldPass.backgroundColor = underlineColor;
    lblNewPass.backgroundColor = underlineColor;
    lblReenterNewPass.backgroundColor = underlineColor;
    
    UIColor * TitleColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblOldPassTitle.textColor = TitleColor;
    lblNewPassTitle.textColor = TitleColor;
    lblReenterNewPassTitle.textColor = TitleColor;
    btnChangeClicked.backgroundColor = TitleColor;
    
    lblOldPassTitle.hidden = YES;
    lblNewPassTitle.hidden = YES;
    lblReenterNewPassTitle.hidden = YES;

    [txtOldPassword addTarget:self action:@selector(txtOldPassData) forControlEvents:UIControlEventEditingChanged];
    [txtNewPass addTarget:self action:@selector(txtNewPassData) forControlEvents:UIControlEventEditingChanged];
    [txtReenterNewPass addTarget:self action:@selector(txtReenterPassData) forControlEvents:UIControlEventEditingChanged];
    
    UIColor *color = [UIColor whiteColor];
    txtOldPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Old Password" attributes:@{NSForegroundColorAttributeName: color}];
    
    txtNewPass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"New Password" attributes:@{NSForegroundColorAttributeName: color}];
    
    txtReenterNewPass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Re-enter New Password" attributes:@{NSForegroundColorAttributeName: color}];
    
}


- (void) viewWillAppear:(BOOL)animated {
    lblCartListCount.text = [USERDEFAULT valueForKey:@"CartCount"];
    if ([lblCartListCount.text isEqualToString:@"0"]) {
        lblCartListCount.hidden = YES;
    }
    else {
        lblCartListCount.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark text field delegate
#pragma mark - TextField Delegate Methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField==txtOldPassword) {
        [textField resignFirstResponder];
        [txtNewPass becomeFirstResponder];
        return NO;
    }
    if (textField==txtNewPass) {
        [textField resignFirstResponder];
        [txtReenterNewPass becomeFirstResponder];
        return NO;
    }
    [textField resignFirstResponder];
    return YES;
}

-(void)txtOldPassData {
    if ([txtOldPassword.text isEqualToString:@""]) {
        lblOldPassTitle.hidden = YES;
    }
    else {
        lblOldPassTitle.hidden = NO;
    }
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblOldPass.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblNewPass.backgroundColor = underlineColor;
    lblReenterNewPass.backgroundColor = underlineColor;
}

-(void)txtNewPassData {
    if ([txtNewPass.text isEqualToString:@""]) {
        lblNewPassTitle.hidden = YES;
    }
    else {
        lblNewPassTitle.hidden = NO;
    }
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblOldPass.backgroundColor = underlineColor;
    lblNewPass.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblReenterNewPass.backgroundColor = underlineColor;
}

-(void)txtReenterPassData {
    if ([txtReenterNewPass.text isEqualToString:@""]) {
        lblReenterNewPassTitle.hidden = YES;
    }
    else {
        lblReenterNewPassTitle.hidden = NO;
    }
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblOldPass.backgroundColor = underlineColor;
    lblNewPass.backgroundColor = underlineColor;
    lblReenterNewPass.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnChangeAction:(id)sender {
    [self.view endEditing:YES];
    if ([txtOldPassword.text isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please enter Old password" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    else if ([txtNewPass.text isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please enter New password" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    else if ([txtReenterNewPass.text isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please enter Re-enter New password" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    else if (![txtReenterNewPass.text isEqualToString:txtNewPass.text]) {
        [self.navigationController.view makeToast:@"Password doesn't match" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    
    if(appDelegate.isInternetAvailable) {
        [appDelegate startLoadingview:@"Loading..."];
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForChangePassword) userInfo:nil repeats:NO];
    }else{
        [appDelegate stopLoadingView];
        showAlert(@"Check Connection", AlertInternet);
    }
}


#pragma mark - Post Data To Server
-(void)postDataOnWebserviceForChangePassword {
    NSString *urlString = [NSString stringWithFormat:@"%@change_password.php?", MainURL];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.delegate = self;
    [request setRequestMethod:@"POST"];
    [request setPostValue:[USERDEFAULT valueForKey:@"user_id"] forKey:@"id"];
    [request setPostValue:txtOldPassword.text forKey:@"oldpassword"];
    [request setPostValue:txtNewPass.text forKey:@"newpassword"];
    [request setDidFinishSelector:@selector(checkupdateFinished:)];
    [request setDidFailSelector:@selector(checkupdateFailed:)];
    [request startSynchronous];
}

-(void)checkupdateFinished:(ASIFormDataRequest *)request {
    NSString *receivedString = [request responseString];
    NSLog(@"aa:->%@",receivedString);
    if (request.responseData) {
        NSError *error;
        NSMutableArray*arrChangePass = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
        NSLog(@"%@",arrChangePass);
        
        NSString *strSatus = [NSString stringWithFormat:@"%@",[[arrChangePass objectAtIndex:0]valueForKey:@"status"]];
        if ([strSatus isEqualToString:@"1"]) {
            
            [USERDEFAULT setBool:NO forKey:@"login"];
            [USERDEFAULT setObject:@"" forKey:@"user_id"];
            [USERDEFAULT setObject:@"" forKey:@"user_name"];
            
            UIStoryboard *storyboard = self.storyboard;
            LoginVC *loginObj =
            [storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
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


- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    return YES;
}

-(void)btnCartListTapped:(id)sender {
    UIStoryboard *storyboard = self.storyboard;
    CartVC *loginObj =
    [storyboard instantiateViewControllerWithIdentifier:@"CartVC"];
    loginObj.strHeader = @"CartPush";
    [self.navigationController pushViewController:loginObj animated:YES];
}



@end


