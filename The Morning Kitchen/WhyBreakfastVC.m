//
//  WhyBreakfastVC.m
//  The Morning Kitchen
//
//  Created by deepak jain on 19/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "WhyBreakfastVC.h"
#import "Globel.h"

@interface WhyBreakfastVC ()

@end

@implementation WhyBreakfastVC

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
    //[homeBtn setShowsTouchWhenHighlighted:YES];
    [NavView addSubview:homeBtn];
    
    UIButton *Btncart = [UIButton buttonWithType:UIButtonTypeCustom];
    [Btncart setImage:[UIImage imageNamed:@"cart-1"] forState:UIControlStateNormal];
    [Btncart setImage:[UIImage imageNamed:@"cart-1"] forState:UIControlStateHighlighted];
    Btncart.frame = CGRectMake(self.view.frame.size.width-55, 0, 55, 55);
    [Btncart addTarget:self action:@selector(btnCartListTapped:) forControlEvents:UIControlEventTouchUpInside];
    [NavView addSubview:Btncart];
    
    UIButton *btntnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [btntnBack setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [btntnBack setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
    btntnBack.frame = CGRectMake(40, 5, 45, 45);
    [btntnBack addTarget:self action:@selector(btnBackTapped:) forControlEvents:UIControlEventTouchUpInside];
    //[homeBtn setShowsTouchWhenHighlighted:YES];
    [NavView addSubview:btntnBack];
    
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
    
    
    UILabel *Title_lb = [[UILabel alloc] initWithFrame:CGRectMake(85, 5,200, 44)];
    [Title_lb setText:@"The Morning Kitchen"];
    Title_lb.textAlignment = NSTextAlignmentLeft;
    [Title_lb setTextColor:[UIColor whiteColor]];
    //[Title_lb setBackgroundColor:[UIColor blackColor]];
    [Title_lb setFont:[UIFont fontWithName:FontName size:15.0]];
    
    [Title_lb setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin];
    
    [NavView addSubview:Title_lb];
    
    [self.view addSubview:statusBarView];
    [self.view addSubview:NavView];
    
    
    NSString *strTerms = [NSString stringWithFormat:@"<h2 style='font-size:22px;font-weight:800;color:rgb(238,121,0);text-align:center;'>Why Breakfast is important??</h2><p style='font-size:16px;color:rgb(255,255,255);'>Breakfast provides the body and brain with fuel after an overnight fast - that's where its name originates, breaking the fast! Without breakfast you are effectively running on empty, like trying to start the car with no petrol!</p><p style='font-size:16px;color:rgb(255,255,255);'>When you wake up, the blood sugar your body needs to make your muscles and brain work their best is usually low. Breakfast helps replenish it. Breakfast kick-starts your metabolism, helping you burn calories throughout the day. It has long term health benefits. Even Nutritionists advise us to have breakfast within two hours of walking.</p><p style='font-size:16px;color:rgb(255,255,255);'>It's hard to know, though, if breakfast causes these healthy habits or if people who eat it have healthier lifestyles.</p><p style='font-size:16px;color:rgb(255,255,255);'><b>'There is a well-known phrase',</b></p><h2 style='font-size:22px;font-weight:bold;color:rgb(238,121,0);text-align:left;'>'Breakfast like a King, Lunch like a Prince and Dine like a Pauper'</h2><p style='font-size:16px;color:rgb(255,255,255);'>Many people skip the morning meal because they're rushing to get out the door. It's easy to let breakfast fall low in your list of priorities but just taking a minutes to have something to eat long before lunch time can really make a difference to your day. If you don't eat first thing, you may get so hungry later on that you snack on high-fat, high sugar foods.</p><p style='font-size:16px;color:rgb(255,255,255);'>Reason for skipping breakfast include lack of time, lake of motivation and lake of available breakfast foods in the house</p><p style='font-size:16px;color:rgb(255,255,255);'>Well, we have breakfast idea that can be eaten on-the-go or when you get to work. Let us get breakfast at your door step at your time!!!</p>"];
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData: [strTerms dataUsingEncoding:NSUnicodeStringEncoding] options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes: nil error: nil];
     txtWhyBreakfast.attributedText=attributedString;
    
     CGFloat fixedWidth = txtWhyBreakfast.frame.size.width;
     CGSize newSize = [txtWhyBreakfast sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
     CGRect newFrame = txtWhyBreakfast.frame;
     newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
     txtWhyBreakfast.frame = newFrame;
     
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, txtWhyBreakfast.frame.size.height+10);
    
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
