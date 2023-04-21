//
//  PaymentVC.m
//  The Morning Kitchen
//
//  Created by deepak jain on 22/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "PaymentVC.h"
#import "Globel.h"

@interface PaymentVC ()

@end

@implementation PaymentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    strAddressID = @"";
    arrIteamList = [[NSMutableArray alloc]init];
    arrAddressData = [[NSMutableArray alloc]init];
    [viewPickerforTime removeFromSuperview];
    [viewPickerforDate removeFromSuperview];
    lblUnderline.backgroundColor = [UIColor purpleColor];
    tblViewforIteam.backgroundColor = [UIColor whiteColor];
    viewTotal.backgroundColor = [UIColor whiteColor];
    viewDateTimeBG.backgroundColor = [UIColor whiteColor];
    viewButtonBG.backgroundColor = [UIColor whiteColor];
    lblDateTitle.textColor = GET_COLOR_WITH_RGB(96, 65, 110, 1);
    btnPaytmClicked.backgroundColor = GET_COLOR_WITH_RGB(96, 65, 110, 1);;
    btncashonDelivery.backgroundColor = GET_COLOR_WITH_RGB(96, 65, 110, 1);
    lblTimeTitle.textColor = GET_COLOR_WITH_RGB(96, 65, 110, 1);
    self.view.backgroundColor = GET_COLOR_WITH_RGB(238, 238, 238, 1);
    viewDate.backgroundColor = GET_COLOR_WITH_RGB(216, 216, 223, 1);
    viewTime.backgroundColor = GET_COLOR_WITH_RGB(216, 216, 223, 1);
    lblDate.textColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblTime.textColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblTotalAmt.textColor = GET_COLOR_WITH_RGB(33, 142, 58, 1);
    lblTime.text = @"7:00 AM";
    
    if ([self.strHeader isEqualToString:@"paymentPush"]) {
        lblTotalAmt.text = [NSString stringWithFormat:@"\u20B9 %@", self.TotlalAmount];
        NSData *dataarrDailyCategory = [USERDEFAULT valueForKey:@"arrCartIteamList"];
        arrIteamList = [NSKeyedUnarchiver unarchiveObjectWithData:dataarrDailyCategory];
        [tblViewforIteam reloadData];
        NSLog(@"%@", arrIteamList);
        NSString *strcount = [NSString stringWithFormat:@"%lu", (unsigned long)arrIteamList.count];
        int value = [strcount intValue];
        value = value * 40;
        
        tblViewforIteam.frame = CGRectMake(tblViewforIteam.frame.origin.x, tblViewforIteam.frame.origin.y, tblViewforIteam.frame.size.width, value);
        
        viewTotal.frame = CGRectMake(viewTotal.frame.origin.x, tblViewforIteam.frame.origin.y+tblViewforIteam.frame.size.height+10, viewTotal.frame.size.width, viewTotal.frame.size.height);
        
        viewDateTimeBG.frame = CGRectMake(viewDateTimeBG.frame.origin.x, viewTotal.frame.origin.y+viewTotal.frame.size.height+10, viewDateTimeBG.frame.size.width, viewDateTimeBG.frame.size.height);
        
        viewButtonBG.frame = CGRectMake(viewButtonBG.frame.origin.x, viewDateTimeBG.frame.origin.y+viewDateTimeBG.frame.size.height+10, viewButtonBG.frame.size.width, viewButtonBG.frame.size.height);
        
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, tblViewforIteam.frame.size.height+viewTotal.frame.size.height+viewDateTimeBG.frame.size.height+viewButtonBG.frame.size.height+40);
    }
    else {
        [self postDataOnWebserviceForCartIteamList];
    }
    
    arrTime =[[NSArray alloc] initWithObjects:@"7:00 AM", @"7:30 AM", @"8:00 AM", @"8:30 AM", @"9:00 AM", @"9:30 AM", @"10:00 AM", @"10:30 AM", @"11:00 AM", @"11:30 AM", nil];
    
    viewPickerforTime.frame=CGRectMake(0, SCREEN_HEIGHT-viewPickerforTime.frame.size.height, self.view.frame.size.width, viewPickerforTime.frame.size.height);
    
    viewPickerforDate.frame=CGRectMake(0, SCREEN_HEIGHT-viewPickerforDate.frame.size.height, self.view.frame.size.width, viewPickerforDate.frame.size.height);
    
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
    
    if ([self.strHeader isEqualToString:@"PaymentPush"]) {
        UIButton *btntnBack = [UIButton buttonWithType:UIButtonTypeCustom];
        [btntnBack setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [btntnBack setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
        btntnBack.frame = CGRectMake(40, 5, 45, 45);
        [btntnBack addTarget:self action:@selector(btnBackTapped:) forControlEvents:UIControlEventTouchUpInside];
        [NavView addSubview:btntnBack];
        
        Title_lb.frame = CGRectMake(85, 5,200, 44);
    }
    else {
        Title_lb.frame = CGRectMake(55, 5,200, 44);
    }
    
    [Title_lb setText:@"The Morning Kitchen"];
    Title_lb.textAlignment = NSTextAlignmentLeft;
    [Title_lb setTextColor:[UIColor whiteColor]];
    //[Title_lb setBackgroundColor:[UIColor blackColor]];
    [Title_lb setFont:[UIFont fontWithName:FontName size:15.0]];
    [Title_lb setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin];
    [NavView addSubview:Title_lb];
    [self.view addSubview:statusBarView];
    [self.view addSubview:NavView];
    
    
    
    
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"hh:mm a";
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    strCurrentTime = [dateFormatter stringFromDate:now];
    NSLog(@"The Current Time is %@",[dateFormatter stringFromDate:now]);
    
    date1= [dateFormatter dateFromString:strCurrentTime];
    date2 = [dateFormatter dateFromString:@"11:30 AM"];
    
    if ([date2 compare:date1] == NSOrderedDescending) {
        NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"dd/MM/yyyy"];
        lblDate.text = [NSString stringWithFormat:@"%@",[dateFormat stringFromDate:[NSDate date]]];
        NSLog(@"date1 is later than date2");
        
    } else if ([date2 compare:date1] == NSOrderedAscending) {
        tomorrow = [NSDate dateWithTimeInterval:(24*60*60) sinceDate:[NSDate date]];
        NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"dd/MM/yyyy"];
        lblDate.text = [NSString stringWithFormat:@"%@",[dateFormat stringFromDate:tomorrow]];
        NSLog(@"date1 is earlier than date2");
        
    } else {
        tomorrow = [NSDate dateWithTimeInterval:(24*60*60) sinceDate:[NSDate date]];
        NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"dd/MM/yyyy"];
        lblDate.text = [NSString stringWithFormat:@"%@",[dateFormat stringFromDate:tomorrow]];
        NSLog(@"dates are the same");
    }
    
    

}

#pragma mark - Post Data To Server
-(void)postDataOnWebserviceForCartIteamList {
    NSString *urlString = [NSString stringWithFormat:@"%@get_cartlist_by_userid.php?", MainURL];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.delegate = self;
    [request setRequestMethod:@"POST"];
    [request setPostValue:[USERDEFAULT valueForKey:@"user_id"] forKey:@"userid"];
    request.tag = CartLisURLTag;
    [request setDidFinishSelector:@selector(checkupdateFinished:)];
    [request setDidFailSelector:@selector(checkupdateFailed:)];
    [request startSynchronous];
}


- (void)viewWillAppear:(BOOL)animated {
    lblCartListCount.text = [USERDEFAULT valueForKey:@"CartCount"];
    if ([lblCartListCount.text isEqualToString:@"0"]) {
        lblCartListCount.hidden = YES;
    }
    else {
        lblCartListCount.hidden = NO;
    }
    //------------------------------------------//
    if(appDelegate.isInternetAvailable) {
        [appDelegate startLoadingview:@"Loading..."];
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForGetAddresssList) userInfo:nil repeats:NO];
    }else{
        [appDelegate stopLoadingView];
        showAlert(@"Check Connection", AlertInternet);
    }
}

#pragma mark - Post Data To Server
-(void)postDataOnWebserviceForGetAddresssList {
    NSString *urlString = [NSString stringWithFormat:@"%@get_delivery_address_by_userid.php?", MainURL];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.delegate = self;
    [request setRequestMethod:@"POST"];
    [request setPostValue:[USERDEFAULT valueForKey:@"user_id"] forKey:@"userid"];
    [request setDidFinishSelector:@selector(checkupdateFinished:)];
    [request setDidFailSelector:@selector(checkupdateFailed:)];
    [request startSynchronous];
}

-(void)checkupdateFinished:(ASIFormDataRequest *)request {
    NSString *receivedString = [request responseString];
    NSLog(@"aa:->%@",receivedString);
    if (request.responseData) {
        
        if (request.tag == PaymentURLTag) {
            NSError *error;
            NSMutableArray *arrDATA = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
            NSLog(@"%@",arrDATA);
            NSString *status = [NSString stringWithFormat:@"%@", [[arrAddressData objectAtIndex:0]valueForKey:@"status"]];
            if ([status isEqualToString:@"0"]) {
                NSString *time = [NSString stringWithFormat:@"Your order is placed. Expected delivery by %@", lblTime.text];
                showAlert(@"The Morning Kitchen", time);
                [USERDEFAULT setObject:@"0" forKey:@"CartCount"];
                lblCartListCount.text =@"0";
                if ([lblCartListCount.text isEqualToString:@"0"]) {
                    lblCartListCount.hidden = YES;
                }
                else {
                    lblCartListCount.hidden = NO;
                }
                return;
            }
            else {
                if ([APP_DELEGATE.strPaymentType isEqualToString:@"cash on delivery"]) {
                    UIStoryboard *storyboard = self.storyboard;
                    YourOrderVC *loginObj =
                    [storyboard instantiateViewControllerWithIdentifier:@"YourOrderVC"];
                    [self.navigationController pushViewController:loginObj animated:YES];
                }
                else {
                    NSString *strPaytmStatus = [NSString stringWithFormat:@"%@", [[arrAddressData objectAtIndex:0]valueForKey:@"order_id"]];
                    NSLog(@"%@", strPaytmStatus);
                }
            }
            
        }
        
        
        
        if (request.tag == CartLisURLTag) {
            NSError *error;
            arrIteamList = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
            NSLog(@"%@",arrIteamList);
            
            NSString *status = [NSString stringWithFormat:@"%@", [[arrIteamList objectAtIndex:0]valueForKey:@"status"]];
            if ([status isEqualToString:@"0"]) {
                lblTotalAmt.text = [NSString stringWithFormat:@"\u20B9 0"];
                
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"CART IS EMPTY" message:@"Please do add some item in your cart first" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                alert.tag=105;
                [alert show];
                
                [USERDEFAULT setObject:@"0" forKey:@"CartCount"];
                lblCartListCount.text = @"0";
                if ([lblCartListCount.text isEqualToString:@"0"]) {
                    lblCartListCount.hidden = YES;
                }
                else {
                    lblCartListCount.hidden = NO;
                }
            }
            else {
                [arrIteamList removeObjectAtIndex:0];
                NSLog(@"Result array :->%@",arrIteamList);
                
                [arrIteamList removeObjectAtIndex:0];
                NSLog(@"Result array :->%@",arrIteamList);
                
                NSString *strCount = [NSString stringWithFormat:@"%lu", (unsigned long)arrIteamList.count];
                int value = [strCount intValue];
                value = value * 40;
                
                tblViewforIteam.frame = CGRectMake(tblViewforIteam.frame.origin.x, tblViewforIteam.frame.origin.y, tblViewforIteam.frame.size.width, value);
                
                viewTotal.frame = CGRectMake(viewTotal.frame.origin.x, tblViewforIteam.frame.origin.y+tblViewforIteam.frame.size.height+10, viewTotal.frame.size.width, viewTotal.frame.size.height);
                
                viewDateTimeBG.frame = CGRectMake(viewDateTimeBG.frame.origin.x, viewTotal.frame.origin.y+viewTotal.frame.size.height+10, viewDateTimeBG.frame.size.width, viewDateTimeBG.frame.size.height);
                
                viewButtonBG.frame = CGRectMake(viewButtonBG.frame.origin.x, viewDateTimeBG.frame.origin.y+viewDateTimeBG.frame.size.height+10, viewButtonBG.frame.size.width, viewButtonBG.frame.size.height);
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, tblViewforIteam.frame.size.height+viewTotal.frame.size.height+viewDateTimeBG.frame.size.height+viewButtonBG.frame.size.height+40);
                
                arrTotal = [[NSMutableArray alloc]init];
                
                for (int i=0; i<arrIteamList.count; i++) {
                    NSString *strTotal = [[arrIteamList objectAtIndex:i]valueForKey:@"item_total"];
                    [arrTotal addObject:strTotal];
                }
                NSLog(@"%@", arrTotal);
                NSString *strTlt = [NSString stringWithFormat:@"%@", arrTotal];
                strTlt = [[strTlt description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"()"]];
                strTlt = [strTlt stringByReplacingOccurrencesOfString:@" " withString:@""];
                strTlt = [strTlt stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                
                int sum = 0;
                if (![strTlt isEqualToString:@""]) {
                    NSArray *arrExIteamPrice = [strTlt componentsSeparatedByString:@","];
                    for (NSNumber *num in arrExIteamPrice) {
                        sum += [num intValue];
                    }
                    NSLog(@"%ld", (long)sum);
                    
                }
                _TotlalAmount = [NSString stringWithFormat:@"%d", sum];
                lblTotalAmt.text = [NSString stringWithFormat:@"\u20B9 %d", sum];
                
                [tblViewforIteam reloadData];
                [APP_DELEGATE stopAnimating];
                [APP_DELEGATE stopLoadingView];
            }

            
        }
        
        
        
        else {
            NSError *error;
            arrAddressData = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
            NSLog(@"%@",arrAddressData);
            
            NSString *status = [NSString stringWithFormat:@"%@", [[arrAddressData objectAtIndex:0]valueForKey:@"status"]];
            if ([status isEqualToString:@"0"]) {
                return;
            }
            else {
                [arrAddressData removeObjectAtIndex:0];
                NSLog(@"Result array :->%@",arrAddressData);
                
                NSString *strcount = [NSString stringWithFormat:@"%lu", (unsigned long)arrAddressData.count];
                int value = [strcount intValue];
                value = value * 45;
                
                tblViewforIteam.frame = CGRectMake(tblViewforIteam.frame.origin.x, tblViewforIteam.frame.origin.y, tblViewforIteam.frame.size.width, tblViewforIteam.frame.size.height);
                
                viewTotal.frame = CGRectMake(viewTotal.frame.origin.x, tblViewforIteam.frame.origin.y+tblViewforIteam.frame.size.height+10, viewTotal.frame.size.width, viewTotal.frame.size.height);
                
                viewDateTimeBG.frame = CGRectMake(viewDateTimeBG.frame.origin.x, viewTotal.frame.origin.y+viewTotal.frame.size.height+10, viewDateTimeBG.frame.size.width, viewDateTimeBG.frame.size.height);
                
                tblViewforAddress.frame = CGRectMake(tblViewforAddress.frame.origin.x, viewDateTimeBG.frame.origin.y+viewDateTimeBG.frame.size.height, tblViewforAddress.frame.size.width, value);
                
                viewButtonBG.frame = CGRectMake(viewButtonBG.frame.origin.x, tblViewforAddress.frame.origin.y+tblViewforAddress.frame.size.height+10, viewButtonBG.frame.size.width, viewButtonBG.frame.size.height);
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, tblViewforIteam.frame.size.height+viewTotal.frame.size.height+viewDateTimeBG.frame.size.height+viewButtonBG.frame.size.height+tblViewforAddress.frame.size.height+40);
                
                
                [tblViewforAddress reloadData];
                [APP_DELEGATE stopAnimating];
                [APP_DELEGATE stopLoadingView];
            }
            
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

#pragma mark picker view delegate
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return   1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSInteger rows = 0;
    if(pickerView == pickerCategoryforTime) rows = [arrTime count];
    
    return rows;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView ==pickerCategoryforTime) {
        return [arrTime objectAtIndex:row];
    }
    return 0;
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView == pickerCategoryforTime) {
        strTimeValue =[arrTime objectAtIndex:row];
        SelTimeID=row;
    }
}


#pragma mark - Drag delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSInteger rows = 0;
    
    if(tableView == tblViewforIteam) rows = [arrIteamList count];
    if(tableView == tblViewforAddress) rows = [arrAddressData count];
    
    return rows;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView==tblViewforIteam) {
        static NSString *simpleTableIdentifier = @"cell";
        IteamShowInCartTableViewCell *cell = (IteamShowInCartTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"IteamShowInCartTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.separatorInset = UIEdgeInsetsZero;
        
        NSString *strName = [[arrIteamList objectAtIndex:indexPath.item]objectForKey:@"item_name"];
        NSString*strQty = [NSString stringWithFormat:@"%@", [[arrIteamList objectAtIndex:indexPath.item]objectForKey:@"item_qty"]];
        strName = [strName stringByAppendingString:@"("];
        strName = [strName stringByAppendingString:strQty];
        strName = [strName stringByAppendingString:@")"];
        [[cell lblIteam]setText:strName];
        
        cell.lblPrice.text = [NSString stringWithFormat:@"\u20B9 %@",[[arrIteamList objectAtIndex:indexPath.row]valueForKey:@"item_total"]];
        //Configure the cell...
        
        return cell;
    }
    else if (tableView == tblViewforAddress) {
        static NSString *simpleTableIdentifier = @"cell";
        ExtraIteamTableViewCell *cell = (ExtraIteamTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ExtraIteamTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.separatorInset = UIEdgeInsetsZero;
        [[cell lblExtraIteam]setText:[[arrAddressData objectAtIndex:indexPath.row]valueForKey:@"darea"]];
        
        
        
        NSString *strDeleteID = [[arrAddressData objectAtIndex:indexPath.row]valueForKey:@"id"];
        if ([strDeleteID isEqualToString:strAddressID]) {
            [cell.btnChecked setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
        }
        else {
            [cell.btnChecked setImage:[UIImage imageNamed:@"uncheck"] forState:UIControlStateNormal];
        }
        
        cell.btnChecked.tag=indexPath.row;
        [cell.btnChecked addTarget:self action:@selector(btnRadioActionClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        //Configure the cell...
        
        return cell;
    }
    //Configure the cell...
    
    return 0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(void)btnRadioActionClicked:(UIButton*)sender  {
    CGPoint button1 = [sender convertPoint:CGPointZero toView:tblViewforAddress];
    NSIndexPath *index = [tblViewforAddress indexPathForRowAtPoint:button1];
    strAddressID = [[arrAddressData objectAtIndex:sender.tag]valueForKey:@"id"];
    [tblViewforAddress reloadData];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)DoneTimePickerAction:(id)sender {
    NSLog(@"%@", strTimeValue);
    lblTime.text = strTimeValue;
    [viewPickerforTime removeFromSuperview];
}

- (IBAction)CancelTimePickerAction:(id)sender {
    [viewPickerforTime removeFromSuperview];
}

- (IBAction)btnCancelDatePicker:(UIButton *)sender {
    [viewPickerforDate removeFromSuperview];
}


- (IBAction)btnDoneDatePicker:(UIButton *)sender {
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    lblDate.text = [NSString stringWithFormat:@"%@",[dateFormat stringFromDate:pickerDate.date]];
    [viewPickerforDate removeFromSuperview];
}

- (IBAction)btnDateAction:(id)sender {
    pickerDate.datePickerMode = UIDatePickerModeDate;
    if ([date2 compare:date1] == NSOrderedDescending) {
        pickerDate.minimumDate = [NSDate date];
        pickerDate.date=[NSDate date];
        NSLog(@"date1 is later than date2");
        
    } else if ([date2 compare:date1] == NSOrderedAscending) {
        pickerDate.minimumDate = tomorrow;
        pickerDate.date=tomorrow;
        NSLog(@"date1 is earlier than date2");
        
    } else {
        pickerDate.minimumDate = tomorrow;
        pickerDate.date=tomorrow;
        NSLog(@"dates are the same");
    }
    viewPickerforTime.hidden = TRUE;
    viewPickerforDate.hidden = FALSE;
    [self.view endEditing:TRUE];
    [self.view addSubview:viewPickerforDate];
    [self.view bringSubviewToFront:viewPickerforDate];
    
}
- (IBAction)btnTimeAction:(id)sender {
    [self.view endEditing:YES];
    if (strTimeValue.length <=0) {
        strTimeValue=[arrTime objectAtIndex:0];
    }
    [self.view addSubview:viewPickerforTime];
    pickerCategoryforTime.hidden = FALSE;
    pickerCategoryforTime.hidden = true;
    [viewPickerforDate removeFromSuperview];
}


- (IBAction)btnPaytmAction:(id)sender {
    if ([strAddressID isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please select address" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    APP_DELEGATE.strPaymentType = @"paytm";
    NSLog(@"%@",[USERDEFAULT valueForKey:@"user_id"]);
    NSLog(@"%@", APP_DELEGATE.strPaymentType);
    NSLog(@"%@", strAddressID);
    NSLog(@"%@", self.TotlalAmount);
    NSLog(@"%@", lblTime.text);
    NSLog(@"%@", lblDate.text);
    
    //------------------------------------------//
    if(appDelegate.isInternetAvailable) {
        [appDelegate startLoadingview:@"Loading..."];
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForCashOnDelivery) userInfo:nil repeats:NO];
    }else{
        [appDelegate stopLoadingView];
        showAlert(@"Check Connection", AlertInternet);
    }
    
}
- (IBAction)btnCashonDeliveryAction:(id)sender {
    if ([strAddressID isEqualToString:@""]) {
        [self.navigationController.view makeToast:@"Please select address" duration:3.0 position:CSToastPositionBottom];
        return;
    }
    APP_DELEGATE.strPaymentType = @"cash on delivery";
    NSLog(@"%@",[USERDEFAULT valueForKey:@"user_id"]);
    NSLog(@"%@", APP_DELEGATE.strPaymentType);
    NSLog(@"%@", strAddressID);
    NSLog(@"%@", self.TotlalAmount);
    NSLog(@"%@", lblTime.text);
    NSLog(@"%@", lblDate.text);
    
    //------------------------------------------//
    if(appDelegate.isInternetAvailable) {
        [appDelegate startLoadingview:@"Loading..."];
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForCashOnDelivery) userInfo:nil repeats:NO];
    }else{
        [appDelegate stopLoadingView];
        showAlert(@"Check Connection", AlertInternet);
    }
    
}

#pragma mark - Post Data To Server
-(void)postDataOnWebserviceForCashOnDelivery {
    NSString *urlString = [NSString stringWithFormat:@"%@place_order.php?", MainURL];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.delegate = self;
    [request setRequestMethod:@"POST"];
    [request setPostValue:[USERDEFAULT valueForKey:@"user_id"] forKey:@"userid"];
    [request setPostValue:@"" forKey:@"remark"];
    [request setPostValue:APP_DELEGATE.strPaymentType forKey:@"order_type"];
    [request setPostValue:[USERDEFAULT valueForKey:@"user_id"] forKey:@"deliver_address"];
    [request setPostValue:self.TotlalAmount forKey:@"total_amount"];
    [request setPostValue:lblTime.text forKey:@"order_time"];
    [request setPostValue:lblDate.text forKey:@"order_date"];
    [request setPostValue:@"insert" forKey:@"action"];
    request.tag = PaymentURLTag;
    [request setDidFinishSelector:@selector(checkupdateFinished:)];
    [request setDidFailSelector:@selector(checkupdateFailed:)];
    [request startSynchronous];
}



- (IBAction)btnAddNewAction:(id)sender {
    APP_DELEGATE.strAddress=@"insert";
    UIStoryboard *storyboard = self.storyboard;
    AddressDetailVC *loginObj =
    [storyboard instantiateViewControllerWithIdentifier:@"AddressDetailVC"];
    loginObj.NewAddressAdd = @"NewAddressforDelivery";
    APP_DELEGATE.strAddress = @"insert";
    [self.navigationController pushViewController:loginObj animated:YES];
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


#pragma mark SFind It Issue
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag ==105) {
        UIStoryboard *storyboard = self.storyboard;
        HomeVC *loginObj =
        [storyboard instantiateViewControllerWithIdentifier:@"HomeVC"];
        [self.navigationController pushViewController:loginObj animated:YES];
    }
}

@end




















