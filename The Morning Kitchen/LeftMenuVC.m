 //
//  LeftMenuVC.m
//  The Morning Kitchen
//
//  Created by Saturncube on 17/01/17.
//  Copyright © 2017 Saturncube. All rights reserved.
//

#import "LeftMenuVC.h"
#import "Globel.h"

@interface LeftMenuVC ()

@end

@implementation LeftMenuVC

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self.slideOutAnimationEnabled = YES;
    return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [tblView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
    [tblView reloadData];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(LeftMenuTableViewREload) name:@"REFRESH" object:nil];
}


- (void)LeftMenuTableViewREload {
    [tblView reloadData];
}





#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 11;
}


//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
  //  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tblView.frame.size.width, 20)];
  //  view.backgroundColor = [UIColor clearColor];
//return view;
//}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 11;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LeftMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftcell"];
    
    //-------------------------Create a Side menu in options------------------------//
    switch (indexPath.row) {
        case 0:
            cell.lblMenu.text = @"Home";
            cell.imgMenu.image = [UIImage imageNamed:@"home"];
            break;
            
        case 1:
            cell.lblMenu.text = @"Menu";
            cell.imgMenu.image = [UIImage imageNamed:@"menu"];
            break;
            
        case 2:
            cell.lblMenu.text = @"Address";
            cell.imgMenu.image = [UIImage imageNamed:@"address"];
            break;
        case 3:
            cell.lblMenu.text = @"Change Password";
            cell.imgMenu.image = [UIImage imageNamed:@"changepassword"];
            break;
        case 4:
            cell.lblMenu.text = @"Your Orders";
            cell.imgMenu.image = [UIImage imageNamed:@"yourorder"];
            break;
        case 5:
            cell.lblMenu.text = @"Notification";
            cell.imgMenu.image = [UIImage imageNamed:@"notification"];
            break;
        case 6:
            cell.lblMenu.text=@"About Us";
            cell.imgMenu.image = [UIImage imageNamed:@"aboutus"];
            break;
        case 7:
            cell.lblMenu.text=@"Contact Us";
            cell.imgMenu.image = [UIImage imageNamed:@"contactus"];
            break;
        case 8:
            cell.lblMenu.text=@"Cart";
            cell.imgMenu.image = [UIImage imageNamed:@"cart"];
            break;
        case 9:
            cell.lblMenu.text=@"Checkout";
            cell.imgMenu.image = [UIImage imageNamed:@"checkout"];
            break;
        case 10:
            cell.lblMenu.text=@"Logout";
            cell.imgMenu.image = [UIImage imageNamed:@"logout"];
            break;
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.separatorInset = UIEdgeInsetsZero;
    //UIColor *myColor = [UIColor colorWithRed:(45.0 / 255.0) green:(45.0 / 255.0) blue:(45.0 / 255.0) alpha: 1];
    //cell.backgroundColor = myColor;
    //UIView *bgColorView = [[UIView alloc] init];
    //bgColorView.backgroundColor = [UIColor blackColor];
    //[cell setSelectedBackgroundView:bgColorView];
    //cell.lblMenu.textColor=[UIColor whiteColor];
    //cell.layer.shadowColor = [[UIColor whiteColor] CGColor];
    //cell.layer.shadowOpacity = 2.0;
    //cell.layer.shadowOffset = CGSizeMake(0, 1);
    //cell.separatorInset = UIEdgeInsetsZero;
    //cell.lblMenu.font =UI_ROBOTO_FONT_REGULAR(15);
    
   // UIColor *topcolor = [UIColor colorWithRed:(75.0 / 255.0) green:(75.0 / 255.0) blue:(75.0 / 255.0) alpha: 1];
//UIColor *bottomcolor = [UIColor colorWithRed:(25.0 / 255.0) green:(25.0 / 255.0) blue:(25.0 / 255.0) alpha: 1];
    
  //  UIView *topLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1)];
  //  topLineView.backgroundColor = topcolor;
  //  [cell.contentView addSubview:topLineView];
    
  //  UIView *topEndView = [[UIView alloc] initWithFrame:CGRectMake(0, 51, self.view.bounds.size.width, 1)];
  //  topEndView.backgroundColor = bottomcolor;
  //  [cell.contentView addSubview:topEndView];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    //------------------------Side Menu Button Click event------------------------------//
    //
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    switch (indexPath.row)
    {
        case 0:vc =[mainStoryboard instantiateViewControllerWithIdentifier: @"HomeVC"];;
            break;
            
        case 1:
            APP_DELEGATE.strMenu = @"Menu";
            vc =[mainStoryboard instantiateViewControllerWithIdentifier: @"MenuListVC"];;
            break;
            
        case 2:
            vc =[mainStoryboard instantiateViewControllerWithIdentifier: @"AddressVC"];
            break;
            
        case 3:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"ChangePasswordVC"];
            break;
            
        case 4:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"YourOrderVC"];
            break;
            
        case 5:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"NotificationVC"];
            break;
            
        case 6:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"AboutUsVC"];
            break;
            
        case 7:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"ContactUsVC"];
            break;
            
        case 8:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"CartVC"];
            break;
            
        case 9:
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"PaymentVC"];
            break;
        case 10:
            [USERDEFAULT setBool:NO forKey:@"login"];
            [USERDEFAULT setObject:@"" forKey:@"user_id"];
            [USERDEFAULT setObject:@"" forKey:@"user_name"];
            vc = [mainStoryboard instantiateViewControllerWithIdentifier: @"LoginVC"];
            break;
            
            
    }
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc withSlideOutAnimation:self.slideOutAnimationEnabled andCompletion:nil];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//-(void) collapseMenu
//{
//    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
//    
//    [UIView animateWithDuration:0.8
//                     animations:^
//     {
//         [self.view setFrame:CGRectMake(MENU_LEFT_COLLAPSED, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
//     }
//                     completion:^(BOOL finished)
//     {
//         self.view.alpha = 1.0;
//         
//     }];
//    
//}
//
//-(void) expandMenu
//{
//    
//    [UIView animateWithDuration:0.8
//                     animations:^
//     {
//         [self.view setFrame:CGRectMake(0, self.view.frame.origin.y, [[UIScreen mainScreen] bounds].size.width, self.view.frame.size.height)];
//     }
//                     completion:^(BOOL finished)
//     {
//         self.view.alpha = 1.0;
//         self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
//         //self.view.backgroundColor = [UIColor clearColor];
//     }];
//}
//
//-(void) GcollapseMenu
//{
//    //[[NSNotificationCenter defaultCenter] postNotificationName:@"backfromview" object:nil];
//    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
//    
//    [UIView animateWithDuration:0.8
//                     animations:^
//     {
//         [self.view setFrame:CGRectMake(MENU_LEFT_COLLAPSED, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
//     }
//                     completion:^(BOOL finished)
//     {
//         self.view.alpha = 1.0;
//     }];
//    
//}
//
//-(void) GexpandMenu
//{
//    [UIView animateWithDuration:0.8
//                     animations:^
//     {
//         [self.view setFrame:CGRectMake(0, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
//     }
//                     completion:^(BOOL finished)
//     {
//         self.view.alpha = 1.0;
//         self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
//     }];
//    
//}


@end

