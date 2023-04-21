//
//  CartVC.m
//  The Morning Kitchen
//
//  Created by deepak jain on 18/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "CartVC.h"
#import "Globel.h"

@interface CartVC ()

@end

@implementation CartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    arrCartIteamList = [[NSMutableArray alloc]init];
    arrTotal = [[NSMutableArray alloc]init];
    viewTotal.hidden = YES;
    btnMakePaymentClicked.hidden = YES;
    self.view.backgroundColor = GET_COLOR_WITH_RGB(222, 214, 224, 1);
    lblTotalAmt.textColor = GET_COLOR_WITH_RGB(33, 142, 58, 1);
    viewTotal.backgroundColor = [UIColor whiteColor];
    btnMakePaymentClicked.backgroundColor = GET_COLOR_WITH_RGB(96, 65, 110, 1);
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
    //[Btncart addTarget:self action:@selector(btnCartListTapped:) forControlEvents:UIControlEventTouchUpInside];
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
    
    if ([self.strHeader isEqualToString:@"CartPush"]) {
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
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    lblCartListCount.text = [USERDEFAULT valueForKey:@"CartCount"];
    if ([lblCartListCount.text isEqualToString:@"0"]) {
        lblCartListCount.hidden = YES;
    }
    else {
        lblCartListCount.hidden = NO;
    }
    if(appDelegate.isInternetAvailable) {
        [appDelegate startLoadingview:@"Loading..."];
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForCartIteamList) userInfo:nil repeats:NO];
    }else{
        [appDelegate stopLoadingView];
        showAlert(@"Check Connection", AlertInternet);
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
    [request setDidFinishSelector:@selector(checkupdateFinished:)];
    [request setDidFailSelector:@selector(checkupdateFailed:)];
    [request startSynchronous];
}


-(void)checkupdateFinished:(ASIFormDataRequest *)request {
    NSString *receivedString = [request responseString];
    NSLog(@"aa:->%@",receivedString);
    if (request.responseData) {
        
        if (request.tag == DeleteCartIteamURLTag) {
            [self postDataOnWebserviceForCartIteamList];
        }
        else {
            NSError *error;
            arrCartIteamList = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
            NSLog(@"%@",arrCartIteamList);
            
            NSString *status = [NSString stringWithFormat:@"%@", [[arrCartIteamList objectAtIndex:0]valueForKey:@"status"]];
            if ([status isEqualToString:@"0"]) {
                viewTotal.hidden = YES;
                btnMakePaymentClicked.hidden = YES;
                showAlert(@"CART IS EMPTY", @"Please do add some item in your cart first");
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
                [arrCartIteamList removeObjectAtIndex:0];
                NSLog(@"Result array :->%@",arrCartIteamList);
                
                [arrCartIteamList removeObjectAtIndex:0];
                NSLog(@"Result array :->%@",arrCartIteamList);
                
                
                NSString *strCount = [NSString stringWithFormat:@"%lu", (unsigned long)arrCartIteamList.count];
                [USERDEFAULT setObject:strCount forKey:@"CartCount"];
                lblCartListCount.text = strCount;
                if ([lblCartListCount.text isEqualToString:@""]) {
                    lblCartListCount.hidden = YES;
                }
                else {
                    lblCartListCount.hidden = NO;
                }
                int value = [strCount intValue];
                value = value * 105;
                tblView.frame = CGRectMake(tblView.frame.origin.x, 0, tblView.frame.size.width, value);
                
                viewTotal.frame = CGRectMake(viewTotal.frame.origin.x, tblView.frame.origin.y+tblView.frame.size.height+15, viewTotal.frame.size.width, viewTotal.frame.size.height);
                
                btnMakePaymentClicked.frame = CGRectMake(btnMakePaymentClicked.frame.origin.x, viewTotal.frame.origin.y+viewTotal.frame.size.height+15, btnMakePaymentClicked.frame.size.width, btnMakePaymentClicked.frame.size.height);
                
                viewTotal.hidden = NO;
                btnMakePaymentClicked.hidden = NO;
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, viewTotal.frame.size.height+btnMakePaymentClicked.frame.size.height+value+110);
                
                arrTotal = [[NSMutableArray alloc]init];
                
                for (int i=0; i<arrCartIteamList.count; i++) {
                    NSString *strTotal = [[arrCartIteamList objectAtIndex:i]valueForKey:@"item_total"];
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
                strTotlalAmount = [NSString stringWithFormat:@"%d", sum];
                lblTotalAmt.text = [NSString stringWithFormat:@"\u20B9 %d", sum];
                
                NSData *dataSave = [NSKeyedArchiver archivedDataWithRootObject:arrCartIteamList];
                [USERDEFAULT setObject:dataSave forKey:@"arrCartIteamList"];
                
                
                
                [tblView reloadData];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 105;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return arrCartIteamList.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"cell";
    CartIteamTableViewCell *cell = (CartIteamTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CartIteamTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.separatorInset = UIEdgeInsetsZero;
    
    NSString *strName = [[arrCartIteamList objectAtIndex:indexPath.item]objectForKey:@"item_name"];
    
    NSString*strPrice = [NSString stringWithFormat:@"%@", [[arrCartIteamList objectAtIndex:indexPath.item]objectForKey:@"item_price"]];
    
    NSString*strQty = [NSString stringWithFormat:@"%@", [[arrCartIteamList objectAtIndex:indexPath.item]objectForKey:@"item_qty"]];
    
        strName = [strName stringByAppendingString:@"("];
        strName = [strName stringByAppendingString:strQty];
        strName = [strName stringByAppendingString:@")"];
    [[cell lblIteam]setText:strName];
    
    int valuePrice = [strPrice intValue];
    int valueQty = [strQty intValue];
    valuePrice = valuePrice * valueQty;
    
    [[cell lblPrice]setText:[NSString stringWithFormat:@"\u20B9 %d",valuePrice]];
    
    NSString *strExtraItm = [[arrCartIteamList objectAtIndex:indexPath.item]objectForKey:@"extra_item"];
    if ([strExtraItm isEqualToString:@""]) {
        cell.lblExtraIteam.text = @"No Extra Item Added";
        cell.lblExtraItmPrice.hidden = YES;
    }
    else {
        cell.lblExtraIteam.text = strExtraItm;
        cell.lblExtraItmPrice.hidden = NO;
        cell.lblExtraItmPrice.text = [NSString stringWithFormat:@"\u20B9 %@", [[arrCartIteamList objectAtIndex:indexPath.row]valueForKey:@"extra_item_price"]];
    }
    
    cell.btnEditClicked.tag=indexPath.row;
    [cell.btnEditClicked addTarget:self action:@selector(btnEditActionClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.btnDeleteClicked.tag=indexPath.row;
    [cell.btnDeleteClicked addTarget:self action:@selector(btnDeleteActionClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //Configure the cell...
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


-(void)btnEditActionClicked:(id)sender {
    CGPoint button1 = [sender convertPoint:CGPointZero toView:tblView];
    NSIndexPath *index = [tblView indexPathForRowAtPoint:button1];
    NSString *stritem_type = [[arrCartIteamList objectAtIndex:index.row]valueForKey:@"item_type"];
    NSLog(@"%@", stritem_type);
    APP_DELEGATE.strCart=@"update";
    UIStoryboard *storyboard = self.storyboard;
    IteamDetailVC *loginObj =
    [storyboard instantiateViewControllerWithIdentifier:@"IteamDetailVC"];
    loginObj.strHeader = @"CartUpdate";
    loginObj.aDict = [arrCartIteamList objectAtIndex:index.row];
    
    [self.navigationController pushViewController:loginObj animated:YES];
    
}


-(void)btnDeleteActionClicked:(id)sender {
    CGPoint button1 = [sender convertPoint:CGPointZero toView:tblView];
    NSIndexPath *index = [tblView indexPathForRowAtPoint:button1];
    strCartDeleteID = [[arrCartIteamList objectAtIndex:index.row]valueForKey:@"id"];
    strID = [[arrCartIteamList objectAtIndex:index.row]valueForKey:@"item_id"];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"DELETE" message:@"Are you sure to remove this address from your profile?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Delete", nil];
    alert.tag=101;
    [alert show];
}

#pragma mark SFind It Issue
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag ==101) {
        if (buttonIndex == 1) {
            if(appDelegate.isInternetAvailable) {
                [appDelegate startLoadingview:@"Loading..."];
                [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForDeleteCartIteam) userInfo:nil repeats:NO];
            }else{
                [appDelegate stopLoadingView];
                showAlert(@"Check Connection", AlertInternet);
            }
        }
    }
}

#pragma mark - Post Data To Server
-(void)postDataOnWebserviceForDeleteCartIteam {
    NSString *urlString = [NSString stringWithFormat:@"%@add_to_cart.php?", MainURL];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.delegate = self;
    [request setRequestMethod:@"POST"];
    [request setPostValue:strCartDeleteID forKey:@"cartid"];
    [request setPostValue:strID forKey:@"id"];
    [request setPostValue:[USERDEFAULT valueForKey:@"user_id"] forKey:@"userid"];
    [request setPostValue:@"" forKey:@"item_name"];
    [request setPostValue:@"" forKey:@"item_qty"];
    [request setPostValue:@"" forKey:@"item_price"];
    [request setPostValue:@"" forKey:@"extra_item"];
    [request setPostValue:@"" forKey:@"extra_item_price"];
    [request setPostValue:@"" forKey:@"item_total"];
    [request setPostValue:@"" forKey:@"item_exclusive"];
    [request setPostValue:@"" forKey:@"item_type"];
    [request setPostValue:@"delete" forKey:@"action"];
    request.tag = DeleteCartIteamURLTag;
    [request setDidFinishSelector:@selector(checkupdateFinished:)];
    [request setDidFailSelector:@selector(checkupdateFailed:)];
    [request startSynchronous];
}



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

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

- (IBAction)btnMakePaymentAction:(id)sender {
    UIStoryboard *storyboard = self.storyboard;
    PaymentVC *loginObj =
    [storyboard instantiateViewControllerWithIdentifier:@"PaymentVC"];
    loginObj.TotlalAmount = strTotlalAmount;
    loginObj.strHeader = @"PaymentPush";
    [self.navigationController pushViewController:loginObj animated:YES];
}


@end




