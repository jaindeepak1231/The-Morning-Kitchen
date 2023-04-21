//
//  HomeVC.m
//  The Morning Kitchen
//
//  Created by deepak jain on 17/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "HomeVC.h"
#import "Globel.h"
#import "PHPageScrollView.h"
#define FontName @"Roboto-Bold"

@interface HomeVC () <PHPageScrollViewDataSource, PHPageScrollViewDelegate>

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrBannerImage = [[NSMutableArray alloc]init];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //--------------------Set Navigation Bar-------------------//
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 20)];
    
    UIView *NavView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width, 50)];
    
    statusBarView.backgroundColor = GET_COLOR_WITH_RGB(117, 82, 133, 1);
    NavView.backgroundColor = GET_COLOR_WITH_RGB(96, 65, 110, 1);
    viewStasurBar.backgroundColor = GET_COLOR_WITH_RGB(117, 82, 133, 1);

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
    
    
    if(appDelegate.isInternetAvailable) {
        [appDelegate startLoadingview:@"Loading..."];
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForBannerImage) userInfo:nil repeats:NO];
    }else{
        [appDelegate stopLoadingView];
        showAlert(@"Check Connection", AlertInternet);
    }
    
    self.pageScrollView.delegate = self;
    self.pageScrollView.dataSource = self;
    [self.pageScrollView reloadData];
    
    count=0;
    
    scrollView.frame = CGRectMake(0, NavView.frame.origin.y+NavView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
    
    self.pageScrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, 230);
    
    viewWhybreakfast.frame = CGRectMake(viewWhybreakfast.frame.origin.x, self.pageScrollView.frame.origin.y+self.pageScrollView.frame.size.height+2, viewWhybreakfast.frame.size.width, 175);
    
    viewMenu.frame = CGRectMake(viewMenu.frame.origin.x, self.pageScrollView.frame.origin.y+self.pageScrollView.frame.size.height+2, viewMenu.frame.size.width, 175);
    
    viewWeekly.frame = CGRectMake(viewWeekly.frame.origin.x, viewWhybreakfast.frame.origin.y+viewWhybreakfast.frame.size.height+2, viewWeekly.frame.size.width, 175);
    
    viewCombo.frame = CGRectMake(viewCombo.frame.origin.x, viewMenu.frame.origin.y+viewMenu.frame.size.height+2, viewCombo.frame.size.width, 175);
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, 230+350);
    
}

- (void)viewWillAppear:(BOOL)animated {
    NSString *str = [NSString stringWithFormat:@"%@",[USERDEFAULT valueForKey:@"CartCount"]];
    if ([str isEqualToString:@"(null)"]) {
        [USERDEFAULT setObject:@"0" forKey:@"CartCount"];
    }
    lblCartListCount.text = [USERDEFAULT valueForKey:@"CartCount"];
    if ([lblCartListCount.text isEqualToString:@"0"]) {
        lblCartListCount.hidden = YES;
    }
    else {
        lblCartListCount.hidden = NO;
    }
}

#pragma mark - Post Data To Server
-(void)postDataOnWebserviceForBannerImage {
    NSString *urlString = [NSString stringWithFormat:@"%@get_banner.php", MainURL];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.delegate = self;
    [request setRequestMethod:@"POST"];
    [request setDidFinishSelector:@selector(checkupdateFinished:)];
    [request setDidFailSelector:@selector(checkupdateFailed:)];
    [request startSynchronous];
}


-(void)checkupdateFinished:(ASIFormDataRequest *)request {
    NSString *receivedString = [request responseString];
    NSLog(@"aa:->%@",receivedString);
    if (request.responseData) {
        NSError *error;
        arrBannerImage = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
        NSLog(@"%@",arrBannerImage);
        [arrBannerImage removeObjectAtIndex:0];
        NSLog(@"Result array :->%@",arrBannerImage);
        
        [self.pageScrollView reloadData];
        
        [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(BannerImageSlide) userInfo:nil repeats:YES];
        
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


- (void)BannerImageSlide {
    [self.pageScrollView scrollToPage:count animation:YES];
    count +=1;
    NSString *strImageCount = [NSString stringWithFormat:@"%lu", (unsigned long)arrBannerImage.count];
    NSString *strCount = [NSString stringWithFormat:@"%lu", (unsigned long)count];
    if ([strImageCount isEqualToString:strCount]) {
        count = 0;
    }
}


- (NSInteger)numberOfPageInPageScrollView:(PHPageScrollView*)pageScrollView {
    return arrBannerImage.count;
}


- (CGSize)sizeCellForPageScrollView:(PHPageScrollView*)pageScrollView {
    return CGSizeMake(self.pageScrollView.frame.size.width, self.pageScrollView.frame.size.height);
}


- (UIView*)pageScrollView:(PHPageScrollView*)pageScrollView viewForRowAtIndex:(int)index {
    //bannerImage=[[aDictResponse objectForKey:@"result"]valueForKey:@"image"];
    
    UIImageView *imgBanner=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.pageScrollView.frame.size.width, self.pageScrollView.frame.size.height)];
    
    NSString *strImage = [[arrBannerImage objectAtIndex:index]valueForKey:@"bimage"];
    //NSString *strImage = [NSString stringWithFormat:@"%@",bannerImage[index]];
    NSString *strimgURL = [NSString stringWithFormat:@"%@%@", BasePathforBannerImage,strImage];
    [imgBanner setImageWithURL:[NSURL URLWithString:strimgURL] placeholderImage:placeHolderImage];
    
    
    [appDelegate stopLoadingView];
    
    return imgBanner;
}


- (void)pageScrollView:(PHPageScrollView*)pageScrollView didScrollToPageAtIndex:(NSInteger)index {
    NSString*array=[NSString stringWithFormat:@"%lu", (unsigned long)[arrBannerImage count]];
    NSString*currentPageIndex=[NSString stringWithFormat:@"%ld", self.pageScrollView.currentPageIndex+1];
    if ([array isEqualToString:currentPageIndex]) {
        
    }
    else {
        
    }
    
    if ([currentPageIndex isEqualToString:@"1"]) {
    }
}


- (void)pageScrollView:(PHPageScrollView *)pageScrollView didTapPageAtIndex:(NSInteger)index {
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 http://projects.hwpl.in/morningkitchen/sysadmin/android/user_login.php?mobileno=98&password=123
*/

- (IBAction)btnWhybreakfastAction:(id)sender {
    UIStoryboard *storyboard = self.storyboard;
    WhyBreakfastVC *loginObj =
    [storyboard instantiateViewControllerWithIdentifier:@"WhyBreakfastVC"];
    [self.navigationController pushViewController:loginObj animated:YES];
}


- (IBAction)btnMenuAction:(id)sender {
    APP_DELEGATE.strMenu = @"Menu";
    UIStoryboard *storyboard = self.storyboard;
    MenuListVC *loginObj =
    [storyboard instantiateViewControllerWithIdentifier:@"MenuListVC"];
    loginObj.strHeader = @"MenuPush";
    [self.navigationController pushViewController:loginObj animated:YES];
}


- (IBAction)btnWeeklyAction:(id)sender {
    APP_DELEGATE.strMenu = @"WeeklySpecial";
    UIStoryboard *storyboard = self.storyboard;
    WeeklySpecialVC *loginObj =
    [storyboard instantiateViewControllerWithIdentifier:@"WeeklySpecialVC"];
    [self.navigationController pushViewController:loginObj animated:YES];
}


- (IBAction)btnComboAction:(id)sender {
    APP_DELEGATE.strMenu = @"ComboOffer";
    UIStoryboard *storyboard = self.storyboard;
    ComboOfferVC *loginObj =
    [storyboard instantiateViewControllerWithIdentifier:@"ComboOfferVC"];
    [self.navigationController pushViewController:loginObj animated:YES];
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


/*
 UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.viewOutlet.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:CGSizeMake(10.0, 10.0)];
 
 CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
 maskLayer.frame = self.view.bounds;
 maskLayer.path  = maskPath.CGPath;
 self.viewOutlet.layer.mask = maskLayer;
 */

@end


