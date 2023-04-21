//
//  AddressVC.m
//  The Morning Kitchen
//
//  Created by deepak jain on 18/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "AddressVC.h"
#import "Globel.h"

@interface AddressVC ()

@end

@implementation AddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //--------------------Set Navigation Bar-------------------//
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 20)];
    UIView *NavView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width, 50)];
    statusBarView.backgroundColor = GET_COLOR_WITH_RGB(117, 82, 133, 1);
    NavView.backgroundColor = GET_COLOR_WITH_RGB(96, 65, 110, 1);
    btnNewAddressClicked.backgroundColor=GET_COLOR_WITH_RGB(96, 65, 110, 1);
    
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
    
    UILabel *Title_lb = [[UILabel alloc] initWithFrame:CGRectMake(55, 5,200, 44)];
    [Title_lb setText:@"The Morning Kitchen"];
    Title_lb.textAlignment = NSTextAlignmentLeft;
    [Title_lb setTextColor:[UIColor whiteColor]];
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
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForGetAllAddressList) userInfo:nil repeats:NO];
    }else{
        [appDelegate stopLoadingView];
        showAlert(@"Check Connection", AlertInternet);
    }
}


#pragma mark - Post Data To Server
-(void)postDataOnWebserviceForGetAllAddressList {
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
        
        if (request.tag == InserUpdateURLTag) {
            [self postDataOnWebserviceForGetAllAddressList];
        }
        else {
            NSError *error;
            arrAddressList = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
            NSLog(@"%@",arrAddressList);
            [arrAddressList removeObjectAtIndex:0];
            NSLog(@"Result array :->%@",arrAddressList);
            
            NSString *strcount = [NSString stringWithFormat:@"%lu", (unsigned long)arrAddressList.count];
            int value = [strcount intValue];
            value = value * 45;
            
            tblView.frame = CGRectMake(0, tblView.frame.origin.y, tblView.frame.size.width, value);
            btnNewAddressClicked.frame = CGRectMake(btnNewAddressClicked.frame.origin.x, tblView.frame.origin.y+tblView.frame.size.height+25, btnNewAddressClicked.frame.size.width, btnNewAddressClicked.frame.size.height);
            
            scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, value+60);
            
            [tblView reloadData];
            [APP_DELEGATE stopAnimating];
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
    return 45;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return arrAddressList.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"cell";
    AddressViewCell *cell = (AddressViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AddressViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.separatorInset = UIEdgeInsetsZero;
    [[cell lblAddress]setText:[[arrAddressList objectAtIndex:indexPath.item]objectForKey:@"darea"]];

    cell.btnEditClicked.tag=indexPath.row;
    [cell.btnEditClicked addTarget:self action:@selector(btnEditActionClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.btnDeleteClicked.tag=indexPath.row;
    [cell.btnDeleteClicked addTarget:self action:@selector(btnDeleteActionClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //Configure the cell...
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = self.storyboard;
    AddressDetailVC *loginObj =
    [storyboard instantiateViewControllerWithIdentifier:@"AddressDetailVC"];
    loginObj.aDict = [arrAddressList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:loginObj animated:YES];
}

-(void)btnEditActionClicked:(id)sender {
    CGPoint button1 = [sender convertPoint:CGPointZero toView:tblView];
    NSIndexPath *index = [tblView indexPathForRowAtPoint:button1];
    APP_DELEGATE.strAddress=@"update";
    UIStoryboard *storyboard = self.storyboard;
    AddressDetailVC *loginObj =
    [storyboard instantiateViewControllerWithIdentifier:@"AddressDetailVC"];
    loginObj.aDict = [arrAddressList objectAtIndex:index.row];
    [self.navigationController pushViewController:loginObj animated:YES];
    
}


-(void)btnDeleteActionClicked:(id)sender {
    CGPoint button1 = [sender convertPoint:CGPointZero toView:tblView];
    NSIndexPath *index = [tblView indexPathForRowAtPoint:button1];
    strAddressDeleteID = [[arrAddressList objectAtIndex:index.row]valueForKey:@"id"];
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
                [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForDeleteAddress) userInfo:nil repeats:NO];
            }else{
                [appDelegate stopLoadingView];
                showAlert(@"Check Connection", AlertInternet);
            }
        }
    }
}


#pragma mark - Post Data To Server
-(void)postDataOnWebserviceForDeleteAddress {
    NSString *urlString = [NSString stringWithFormat:@"%@add_delivery_address.php?", MainURL];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.delegate = self;
    [request setRequestMethod:@"POST"];
    [request setPostValue:[USERDEFAULT valueForKey:@"user_id"] forKey:@"duserid"];
    [request setPostValue:strAddressDeleteID forKey:@"id"];
    [request setPostValue:@"" forKey:@"dname"];
    [request setPostValue:@"" forKey:@"demailid"];
    [request setPostValue:@"" forKey:@"dcontactno"];
    [request setPostValue:@"" forKey:@"dcity"];
    [request setPostValue:@"" forKey:@"darea"];
    [request setPostValue:@"" forKey:@"daddress1"];
    [request setPostValue:@"" forKey:@"daddress2"];
    [request setPostValue:@"" forKey:@"dzipcode"];
    [request setPostValue:@"delete" forKey:@"action"];
    request.tag = InserUpdateURLTag;
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
- (IBAction)btnNewAddressAction:(id)sender {
    APP_DELEGATE.strAddress=@"insert";
    UIStoryboard *storyboard = self.storyboard;
    AddressDetailVC *loginObj =
    [storyboard instantiateViewControllerWithIdentifier:@"AddressDetailVC"];
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


@end




