//
//  AddressDetailVC.m
//  The Morning Kitchen
//
//  Created by deepak jain on 21/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "AddressDetailVC.h"
#import "Globel.h"

@interface AddressDetailVC ()

@end

@implementation AddressDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    strUpdateID = @"";
    NSLog(@"%@", self.aDict);
    if ([APP_DELEGATE.strAddress isEqualToString:@"update"]) {
        strUpdateID = [self.aDict valueForKey:@"id"];
        txtName.text = [self.aDict valueForKey:@"dname"];
        txtEmail.text = [self.aDict valueForKey:@"demailid"];
        txtContactNo.text = [self.aDict valueForKey:@"dcontactno"];
        txtCity.text = [self.aDict valueForKey:@"dcity"];
        txtArea.text = [self.aDict valueForKey:@"darea"];
        txtAddress.text = [self.aDict valueForKey:@"daddress1"];
        txtLandmark.text = [self.aDict valueForKey:@"daddress2"];
        txtZipcode.text = [self.aDict valueForKey:@"dzipcode"];
    }
    
    arrCity = [[NSMutableArray alloc]init];
    arrArea = [[NSMutableArray alloc]init];
    [viewPickerforCity removeFromSuperview];
    [viewPickerforArea removeFromSuperview];
    
    viewPickerforCity.frame=CGRectMake(0, SCREEN_HEIGHT-viewPickerforCity.frame.size.height, self.view.frame.size.width, viewPickerforCity.frame.size.height);
    viewPickerforArea.frame=CGRectMake(0, SCREEN_HEIGHT-viewPickerforArea.frame.size.height, self.view.frame.size.width, viewPickerforCity.frame.size.height);
    
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
    //[homeBtn setShowsTouchWhenHighlighted:YES];
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
    
    UILabel *Title_lb = [[UILabel alloc]init];
    
    UIButton *btntnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [btntnBack setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [btntnBack setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
    btntnBack.frame = CGRectMake(40, 5, 45, 45);
    [btntnBack addTarget:self action:@selector(btnBackTapped:) forControlEvents:UIControlEventTouchUpInside];
    [NavView addSubview:btntnBack];
    
    Title_lb.frame = CGRectMake(85, 5,200, 44);
    [Title_lb setText:@"The Morning Kitchen"];
    Title_lb.textAlignment = NSTextAlignmentLeft;
    [Title_lb setTextColor:[UIColor whiteColor]];
    //[Title_lb setBackgroundColor:[UIColor blackColor]];
    [Title_lb setFont:[UIFont fontWithName:FontName size:15.0]];
    [Title_lb setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin];
    [NavView addSubview:Title_lb];
    [self.view addSubview:statusBarView];
    [self.view addSubview:NavView];
    
    //------------------------------------------//
    lblAddressDetailTitle.textColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblName.backgroundColor = underlineColor;
    lblEmail.backgroundColor = underlineColor;
    lblContactNo.backgroundColor = underlineColor;
    lblCity.backgroundColor = underlineColor;
    lblArea.backgroundColor = underlineColor;
    lblAddress.backgroundColor = underlineColor;
    lblLandmark.backgroundColor = underlineColor;
    lblZipcode.backgroundColor = underlineColor;
    
    UIColor * TitleColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblNameTitle.textColor = TitleColor;
    lblEmailTitle.textColor = TitleColor;
    lblContactNoTitle.textColor = TitleColor;
    lblCityTitle.textColor = TitleColor;
    lblAreaTitle.textColor = TitleColor;
    lblAddressTitle.textColor = TitleColor;
    lblLandmarkTitle.textColor = TitleColor;
    lblZipcodeTitle.textColor = TitleColor;
    btnDoneClicked.backgroundColor = TitleColor;
    btnCancelClicked.backgroundColor = TitleColor;
    
    lblNameTitle.hidden = YES;
    lblEmailTitle.hidden = YES;
    lblContactNoTitle.hidden = YES;
    lblCityTitle.hidden = YES;
    lblAreaTitle.hidden = YES;
    lblAddressTitle.hidden = YES;
    lblLandmarkTitle.hidden = YES;
    lblZipcodeTitle.hidden = YES;
    
    [txtName addTarget:self action:@selector(txtNameData) forControlEvents:UIControlEventEditingChanged];
    
    [txtEmail addTarget:self action:@selector(txtEmailData) forControlEvents:UIControlEventEditingChanged];
    [txtContactNo addTarget:self action:@selector(txtContactData) forControlEvents:UIControlEventEditingChanged];
    
    [txtAddress addTarget:self action:@selector(txtAddressData) forControlEvents:UIControlEventEditingChanged];
    [txtLandmark addTarget:self action:@selector(txtLandmarkData) forControlEvents:UIControlEventEditingChanged];
    [txtZipcode addTarget:self action:@selector(txtZipcodeData) forControlEvents:UIControlEventEditingChanged];
    
    
    UIColor *color = [UIColor whiteColor];
    txtName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Name" attributes:@{NSForegroundColorAttributeName: color}];
    
    txtEmail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: color}];
    
    txtContactNo.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Contact no." attributes:@{NSForegroundColorAttributeName: color}];
    
    txtCity.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Select City:" attributes:@{NSForegroundColorAttributeName: color}];
    
    txtArea.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Select Area:" attributes:@{NSForegroundColorAttributeName: color}];
    
    txtAddress.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Address 1" attributes:@{NSForegroundColorAttributeName: color}];
    
    
    txtLandmark.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Landmark" attributes:@{NSForegroundColorAttributeName: color}];
    
    txtZipcode.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Zipcode" attributes:@{NSForegroundColorAttributeName: color}];
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, 610);
    //------------------------------------------//
    if(appDelegate.isInternetAvailable) {
        [appDelegate startLoadingview:@"Loading..."];
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForGetCityList) userInfo:nil repeats:NO];
    }else{
        [appDelegate stopLoadingView];
        showAlert(@"Check Connection", AlertInternet);
    }
}

- (void)viewWillAppear:(BOOL)animated {
    lblCartListCount.text = [USERDEFAULT valueForKey:@"CartCount"];
    if ([lblCartListCount.text isEqualToString:@"0"]) {
        lblCartListCount.hidden = YES;
    }
    else {
        lblCartListCount.hidden = NO;
    }
}

#pragma mark - Post Data To Server
-(void)postDataOnWebserviceForGetCityList {
    NSString *urlString = [NSString stringWithFormat:@"%@get_citylist.php", MainURL];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.delegate = self;
    request.tag=GetCityTag;
    [request setRequestMethod:@"POST"];
    [request setDidFinishSelector:@selector(checkupdateFinished:)];
    [request setDidFailSelector:@selector(checkupdateFailed:)];
    [request startSynchronous];
}


-(void)checkupdateFinished:(ASIFormDataRequest *)request {
    NSString *receivedString = [request responseString];
    NSLog(@"aa:->%@",receivedString);
    if (request.responseData) {
        if (request.tag == GetCityTag) {
            NSError *error;
            arrCity = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
            NSLog(@"%@",arrCity);
            [arrCity removeObjectAtIndex:0];
            NSLog(@"Result array :->%@",arrCity);
            
            [pickerCategoryforCity reloadAllComponents];
            [APP_DELEGATE stopAnimating];
            [APP_DELEGATE stopLoadingView];
        }
        else if (request.tag == GetAreaTag) {
            NSError *error;
            arrArea = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
            NSLog(@"%@",arrArea);
            [arrArea removeObjectAtIndex:0];
            NSLog(@"Result array :->%@",arrArea);
            
            [pickerCategoryforArea reloadAllComponents];
            [APP_DELEGATE stopAnimating];
            [APP_DELEGATE stopLoadingView];
        }
        else if (request.tag == InserUpdateURLTag) {
            NSError *error;
            NSMutableArray*arrData = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
            NSLog(@"%@",arrData);
            
            NSString *str = [NSString stringWithFormat:@"%@", [[arrData objectAtIndex:0]valueForKey:@"status"]];
            if ([str isEqualToString:@"1"]) {
                [self.navigationController.view makeToast:@"Address added successfully" duration:3.0 position:CSToastPositionBottom];
            }
             [self.navigationController popViewControllerAnimated:YES];
            
            [APP_DELEGATE stopAnimating];
            [APP_DELEGATE stopLoadingView];
        }
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
        [txtEmail becomeFirstResponder];
        return NO;
    }
    if (textField==txtEmail) {
        [textField resignFirstResponder];
        [txtContactNo becomeFirstResponder];
        return NO;
    }
    if (textField==txtContactNo) {
        [textField resignFirstResponder];
        [txtAddress becomeFirstResponder];
        return NO;
    }
    if (textField==txtAddress) {
        [textField resignFirstResponder];
        [txtLandmark becomeFirstResponder];
        return NO;
    }
    if (textField==txtLandmark) {
        [textField resignFirstResponder];
        [txtZipcode becomeFirstResponder];
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
    lblEmail.backgroundColor = underlineColor;
    lblContactNo.backgroundColor = underlineColor;
    lblAddress.backgroundColor = underlineColor;
    lblCity.backgroundColor = underlineColor;
    lblArea.backgroundColor = underlineColor;
    lblLandmark.backgroundColor = underlineColor;
    lblZipcode.backgroundColor = underlineColor;
}

-(void)txtEmailData {
    if ([txtEmail.text isEqualToString:@""]) {
        lblEmailTitle.hidden = YES;
    }
    else {
        lblEmailTitle.hidden = NO;
    }
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblName.backgroundColor = underlineColor;
    lblEmail.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblContactNo.backgroundColor = underlineColor;
    lblAddress.backgroundColor = underlineColor;
    lblCity.backgroundColor = underlineColor;
    lblArea.backgroundColor = underlineColor;
    lblLandmark.backgroundColor = underlineColor;
    lblZipcode.backgroundColor = underlineColor;
}

-(void)txtContactData {
    if ([txtContactNo.text isEqualToString:@""]) {
        lblContactNoTitle.hidden = YES;
    }
    else {
        lblContactNoTitle.hidden = NO;
    }
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblName.backgroundColor = underlineColor;
    lblEmail.backgroundColor = underlineColor;
    lblContactNo.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblAddress.backgroundColor = underlineColor;
    lblCity.backgroundColor = underlineColor;
    lblArea.backgroundColor = underlineColor;
    lblLandmark.backgroundColor = underlineColor;
    lblZipcode.backgroundColor = underlineColor;
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
    lblEmail.backgroundColor = underlineColor;
    lblContactNo.backgroundColor = underlineColor;
    lblAddress.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblCity.backgroundColor = underlineColor;
    lblArea.backgroundColor = underlineColor;
    lblLandmark.backgroundColor = underlineColor;
    lblZipcode.backgroundColor = underlineColor;
}

-(void)txtLandmarkData {
    if ([txtLandmark.text isEqualToString:@""]) {
        lblLandmarkTitle.hidden = YES;
    }
    else {
        lblLandmarkTitle.hidden = NO;
    }
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblName.backgroundColor = underlineColor;
    lblEmail.backgroundColor = underlineColor;
    lblContactNo.backgroundColor = underlineColor;
    lblAddress.backgroundColor = underlineColor;
    lblCity.backgroundColor = underlineColor;
    lblArea.backgroundColor = underlineColor;
    lblLandmark.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblZipcode.backgroundColor = underlineColor;
}

-(void)txtZipcodeData {
    if ([txtZipcode.text isEqualToString:@""]) {
        lblZipcodeTitle.hidden = YES;
    }
    else {
        lblZipcodeTitle.hidden = NO;
    }
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblName.backgroundColor = underlineColor;
    lblEmail.backgroundColor = underlineColor;
    lblContactNo.backgroundColor = underlineColor;
    lblAddress.backgroundColor = underlineColor;
    lblCity.backgroundColor = underlineColor;
    lblArea.backgroundColor = underlineColor;
    lblLandmark.backgroundColor = underlineColor;
    lblZipcode.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
}




#pragma mark picker view delegate
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return   1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSInteger rows = 0;
    if(pickerView == pickerCategoryforCity) rows = [arrCity count];
    if(pickerView == pickerCategoryforArea) rows = [arrArea count];
    
    return rows;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView ==pickerCategoryforCity) {
        return [[arrCity valueForKey:@"city_name"] objectAtIndex:row];
    }
    else if (pickerView == pickerCategoryforArea){
        return [[arrArea valueForKey:@"area_name"] objectAtIndex:row];
    }
    return 0;
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView == pickerCategoryforCity) {
        strCityValue =[[arrCity valueForKey:@"city_name"] objectAtIndex:row];
        SelCityID=row;
    }
    else if (pickerView == pickerCategoryforArea){
        strAreaValue =[[arrArea valueForKey:@"area_name"] objectAtIndex:row];
        SelAreaID=row;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark-Picker Actions
- (IBAction)DoneCityPickerAction:(id)sender {
    NSLog(@"%@", strCityValue);
    txtCity.text = strCityValue;
    
    if ([txtCity.text isEqualToString:@""]) {
        lblCityTitle.hidden = YES;
    }
    else {
        lblCityTitle.hidden = NO;
    }
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblName.backgroundColor = underlineColor;
    lblEmail.backgroundColor = underlineColor;
    lblContactNo.backgroundColor = underlineColor;
    lblAddress.backgroundColor = underlineColor;
    lblCity.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblArea.backgroundColor = underlineColor;
    lblLandmark.backgroundColor = underlineColor;
    lblZipcode.backgroundColor = underlineColor;
    [viewPickerforCity removeFromSuperview];
    
    for (int i = 0; i < [arrCity count];i++ ) {
        NSArray *item = [arrCity objectAtIndex:i];
        NSString * strCityName = [item valueForKey:@"city_name"];
        if ([strCityName rangeOfString: txtCity.text options: NSCaseInsensitiveSearch].location != NSNotFound) {
            strCityId = [item valueForKey:@"ID"];
            NSLog (@"Yay! '%@'", strCityId);
        }
    }
    if(appDelegate.isInternetAvailable) {
        [appDelegate startLoadingview:@"Loading..."];
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForGetAreaList) userInfo:nil repeats:NO];
    }else{
        [appDelegate stopLoadingView];
        showAlert(@"Check Connection", AlertInternet);
    }
}


#pragma mark - Post Data To Server
-(void)postDataOnWebserviceForGetAreaList {
    NSString *urlString = [NSString stringWithFormat:@"%@get_arealist.php?", MainURL];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.delegate = self;
    request.tag=GetAreaTag;
    [request setRequestMethod:@"POST"];
    [request setPostValue:strCityId forKey:@"id"];
    [request setDidFinishSelector:@selector(checkupdateFinished:)];
    [request setDidFailSelector:@selector(checkupdateFailed:)];
    [request startSynchronous];
}

- (IBAction)CancelCityPickerAction:(id)sender {
    [viewPickerforCity removeFromSuperview];
}

- (IBAction)DoneAreaPickerAction:(id)sender {
    NSLog(@"%@", strAreaValue);
    txtArea.text = strAreaValue;
    
    if ([txtArea.text isEqualToString:@""]) {
        lblAreaTitle.hidden = YES;
    }
    else {
        lblAreaTitle.hidden = NO;
    }
    UIColor * underlineColor = GET_COLOR_WITH_RGB(242, 187, 131, 1);
    lblName.backgroundColor = underlineColor;
    lblEmail.backgroundColor = underlineColor;
    lblContactNo.backgroundColor = underlineColor;
    lblAddress.backgroundColor = underlineColor;
    lblCity.backgroundColor = underlineColor;
    lblArea.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblLandmark.backgroundColor = underlineColor;
    lblZipcode.backgroundColor = underlineColor;
    [viewPickerforArea removeFromSuperview];
    
    for (int i = 0; i < [arrArea count];i++ ) {
        NSArray *item = [arrArea objectAtIndex:i];
        NSString * strAreaName = [item valueForKey:@"area_name"];
        if ([strAreaName rangeOfString: txtArea.text options: NSCaseInsensitiveSearch].location != NSNotFound) {
            strAreaId = [item valueForKey:@"ID"];
            NSLog (@"Yay! '%@'", strAreaId);
        }
    }
    
}
- (IBAction)CancelAreaPickerAction:(id)sender {
    [viewPickerforArea removeFromSuperview];
    
}


- (IBAction)btnCityAction:(id)sender {
    [self.view endEditing:YES];
    if (strCityValue.length <=0) {
        strCityValue=[[arrCity objectAtIndex:0] valueForKey:@"city_name"];
    }
    [self.view addSubview:viewPickerforCity];
}


- (IBAction)btnAreaAction:(id)sender {
    [self.view endEditing:YES];
    if ([strCityId isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please Select City" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    if (strAreaValue.length <=0) {
        strAreaValue=[[arrArea objectAtIndex:0] valueForKey:@"area_name"];
    }
    [self.view addSubview:viewPickerforArea];
}


- (IBAction)btnCancelAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)btnDoneAction:(id)sender {
    [self.view endEditing:YES];
    if ([txtName.text isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please enter name" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    else if ([txtEmail.text isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please enter email" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    else if (![APP_DELEGATE validateEmail:txtEmail.text]) {
        [self.navigationController.view makeToast:@"Please enter correct email" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    else if ([txtContactNo.text isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please enter Contact No." duration:3.0 position:CSToastPositionBottom];
        return;
    }
    
    else if ([txtCity.text isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please select city" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    else if ([txtArea.text isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please select area" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    
    if(appDelegate.isInternetAvailable) {
        [appDelegate startLoadingview:@"Loading..."];
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForInsertUpdateAddress) userInfo:nil repeats:NO];
    }else{
        [appDelegate stopLoadingView];
        showAlert(@"Check Connection", AlertInternet);
    }
    
}

#pragma mark - Post Data To Server
-(void)postDataOnWebserviceForInsertUpdateAddress {
    NSString *urlString = [NSString stringWithFormat:@"%@add_delivery_address.php?", MainURL];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.delegate = self;
    [request setRequestMethod:@"POST"];
    [request setPostValue:[USERDEFAULT valueForKey:@"user_id"] forKey:@"duserid"];
    [request setPostValue:strUpdateID forKey:@"id"];
    [request setPostValue:txtName.text forKey:@"dname"];
    [request setPostValue:txtEmail.text forKey:@"demailid"];
    [request setPostValue:txtContactNo.text forKey:@"dcontactno"];
    [request setPostValue:txtCity.text forKey:@"dcity"];
    [request setPostValue:txtArea.text forKey:@"darea"];
    [request setPostValue:txtAddress.text forKey:@"daddress1"];
    [request setPostValue:txtLandmark.text forKey:@"daddress2"];
    [request setPostValue:txtZipcode.text forKey:@"dzipcode"];
    [request setPostValue:APP_DELEGATE.strAddress forKey:@"action"];
    request.tag = InserUpdateURLTag;
    [request setDidFinishSelector:@selector(checkupdateFinished:)];
    [request setDidFailSelector:@selector(checkupdateFailed:)];
    [request startSynchronous];
}



-(void)btnBackTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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





















/*
- (void)GetCurrentDate{
    //Get Current Date//
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger day = [components day];
    NSInteger week = [components month];
    NSInteger year = [components year];
    NSString *string = [NSString stringWithFormat:@"%ld-%ld-%ld", (long)year, (long)week,(long)day ];
    NSLog(@"%@",string);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString*TodayDate = [formatter stringFromDate:[NSDate date]];
    CurrentDate = [TodayDate stringByAppendingString:@" 00:00:00"];
    NSDate *date1 = [formatter dateFromString:TodayDate];
    long lgTime = (long)[date1 timeIntervalSince1970];
    NSLog(@"%ld", lgTime);
    NSCalendar* calender = [NSCalendar currentCalendar];
    NSDateComponents* component = [calender components:NSCalendarUnitWeekday fromDate:date1];
    NSLog(@"date=%@ === %@",[NSDate date],date1);
    NSLog(@"day= %ld",(long)[component weekday]);
    NSInteger weekDay = [component weekday];
    CurrentDay = [[formatter weekdaySymbols] objectAtIndex:weekDay - 1];
    [USERDEFAULT setObject:CurrentDay forKey:@"CurrentDay"];
    [USERDEFAULT setObject:CurrentDate forKey:@"CurrentDate"];
    NSLog(@"Day ::: %@", CurrentDay);
    
}
*/

