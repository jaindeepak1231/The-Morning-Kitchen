//
//  AboutUsVC.m
//  The Morning Kitchen
//
//  Created by deepak jain on 18/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "AboutUsVC.h"
#import "Globel.h"

@interface AboutUsVC ()

@end

@implementation AboutUsVC

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
    
    
    NSString *strAboutUs = [NSString stringWithFormat:@"<h2 style='font-size:22px;font-weight:800;border-bottom:1px solid color:rgb(238,121,0);color:rgb(238,121,0);'>About Us</h2><p style='font-size:16px;color:rgb(255,255,255);'>As a fresher, we had experienced the pain of rushing hours to reach the office with an empty stomach. Those hard times made us homesick as we craved for home-made breakfast which triggered us before. But as many people say everything happens for the sake of good, these bad experience of ours turned into a bright idea of launching 'THE MORNING KITCHEN' which will undoubtedly replenish the needs of our friends of breakfast now with our courteous service you neither have to skip up breakfast nor grab up something unhealthy for breakfast.</p><p style='font-size:16px;color:rgb(255,255,255);'>Our food items will help you start your day with vigor and vitality, and without being overly filling. Our prime motive is to keep you healthy keeping your pockets in mind. So enjoy your breakfast like a 'King' when 'THE MORNING KITCHEN' is there to provide EVERYTHING!!</p><h2 style='font-size:22px;font-weight:800;border-bottom:1px solid color:rgb(238,121,0);color:rgb(238,121,0);'>Vision</h2><p style='font-size:16px;color:rgb(255,255,255);'>Our vision is to spread awareness among Amdavadis about the importance of breakfast. Though most of the people are aware of the health effect of skipping breakfast but shortage of time and trouble of breakfast preparation force them to compromise. The office workers, students in P.G., bachelors, working ladies and call-centers employees are forced to rush to their working place elongating the overnight fasting period. &quot;THE MORNING KITCHEN&quot; thus comes at every door to provide their needs hassle free. Above all, we will even kill the worries of the housewives from monotonous routine of kitchen preparation.</p><h2 style='font-size:22px;font-weight:800;border-bottom:1px solid color:rgb(238,121,0);color:rgb(238,121,0);'>Mission</h2><p style='font-size:16px;color:rgb(255,255,255);'>The aim of &quot;THE MORNING KITCHEN&quot; is to provide convenience, comfort, health and homemade product at affordable price to our associated. Their satisfaction will reflect inner satisfaction to us.</p>"];
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData: [strAboutUs dataUsingEncoding:NSUnicodeStringEncoding] options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes: nil error: nil];
    txtAboutUs.attributedText=attributedString;
    
    CGFloat fixedWidth = txtAboutUs.frame.size.width;
    CGSize newSize = [txtAboutUs sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = txtAboutUs.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    txtAboutUs.frame = newFrame;
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, txtAboutUs.frame.size.height+10);
    
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
