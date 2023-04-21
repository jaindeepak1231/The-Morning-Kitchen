//
//  IteamByMenuVC.m
//  The Morning Kitchen
//
//  Created by deepak jain on 20/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "IteamByMenuVC.h"
#import "Globel.h"


@interface IteamByMenuVC ()

@end

@implementation IteamByMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrMenuIteam = [[NSMutableArray alloc]init];
    
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
    
    if(appDelegate.isInternetAvailable) {
        [appDelegate startLoadingview:@"Loading..."];
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForMenuIteamList) userInfo:nil repeats:NO];
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
-(void)postDataOnWebserviceForMenuIteamList {
    NSString *urlString = [NSString stringWithFormat:@"%@get_item_by_menu.php?", MainURL];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.delegate = self;
    [request setRequestMethod:@"POST"];
    [request setPostValue:_strID forKey:@"menu_id"];
    [request setDidFinishSelector:@selector(checkupdateFinished:)];
    [request setDidFailSelector:@selector(checkupdateFailed:)];
    [request startSynchronous];
}


-(void)checkupdateFinished:(ASIFormDataRequest *)request {
    NSString *receivedString = [request responseString];
    NSLog(@"aa:->%@",receivedString);
    if (request.responseData) {
        NSError *error;
        arrMenuIteam = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
        NSLog(@"%@",arrMenuIteam);
        [arrMenuIteam removeObjectAtIndex:0];
        NSLog(@"Result array :->%@",arrMenuIteam);
        
        [tblView reloadData];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return arrMenuIteam.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"cell";
    IteamListTableViewCell *cell = (IteamListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"IteamListTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.separatorInset = UIEdgeInsetsZero;
    [[cell lblMenu]setText:[[arrMenuIteam objectAtIndex:indexPath.item]objectForKey:@"item_name"]];
    [[cell lblrs]setText:[NSString stringWithFormat:@"\u20B9 %@",[[arrMenuIteam objectAtIndex:indexPath.item]objectForKey:@"item_price"]]];
    
    NSString *strImage = [[arrMenuIteam objectAtIndex:indexPath.row]valueForKey:@"item_image"];
    NSString *strimgURL = [NSString stringWithFormat:@"%@%@", BasePathforIteamImage,strImage];
    [cell.imgFood setImageWithURL:[NSURL URLWithString:strimgURL] placeholderImage:[UIImage imageNamed:@"the-morning-kitchen"]];
    
    NSString *strStock = [[arrMenuIteam objectAtIndex:indexPath.row]valueForKey:@"stock"];
    if (![strStock isEqualToString:@""]) {
        [[cell lblOutofStock]setText:strStock];
        cell.viewOutofBg.hidden = NO;
    }
    
    
    
    
    
    
    
    //Configure the cell...
        
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString*StrImage=[NSString stringWithFormat:@"%@",[[arrMenuIteam objectAtIndex:indexPath.item]objectForKey:@"item_image"]];
    NSString*StrName=[NSString stringWithFormat:@"%@",[[arrMenuIteam objectAtIndex:indexPath.item]objectForKey:@"item_name"]];
    NSString*StrPrice=[NSString stringWithFormat:@"%@",[[arrMenuIteam objectAtIndex:indexPath.item]objectForKey:@"item_price"]];
    [USERDEFAULT setObject:StrImage forKey:@"IMAGE"];
    [USERDEFAULT setObject:StrName forKey:@"NAME"];
    [USERDEFAULT setObject:StrPrice forKey:@"PRICE"];
    
    NSString *strID = [[arrMenuIteam objectAtIndex:indexPath.row]valueForKey:@"id"];
    
    NSString *strStock = [[arrMenuIteam objectAtIndex:indexPath.row]valueForKey:@"stock"];
    if (![strStock isEqualToString:@""]) {
        return;
    }
    
    UIStoryboard *storyboard = self.storyboard;
    IteamDetailVC *loginObj =
    [storyboard instantiateViewControllerWithIdentifier:@"IteamDetailVC"];
    loginObj.strIteamID =strID;
    [self.navigationController pushViewController:loginObj animated:YES];
    
    //    NSString*StrUserID=[[arrFavData objectAtIndex:indexPath.item]objectForKey:@"user_id"];
    //    UIStoryboard *storyboard = self.storyboard;
    //    PinDetailVC *pinObj =
    //    [storyboard instantiateViewControllerWithIdentifier:@"PinDetailVC"];
    //    pinObj.reqID = StrReqID;
    //    pinObj.UserID = StrUserID;
    //    [self.navigationController pushViewController:pinObj animated:YES];
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


@end



