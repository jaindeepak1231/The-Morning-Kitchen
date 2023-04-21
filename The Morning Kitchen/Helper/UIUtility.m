//
//  UIUtility.m
//  JobsApp
//
//  Created by Imran on 12/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIUtility.h"
#import <QuartzCore/QuartzCore.h>
#import "Globel.h"
#define PHEIGHT 44
#define LHEIGHT 38
#define FontName @"Roboto-Bold"

@implementation UIViewController (UIUtility)

-(void)SetbarBtns:(int)level Label:(NSString *)Label {
    
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [[UIScreen mainScreen] bounds].size.width, 22)];
    statusBarView.backgroundColor = GET_COLOR_WITH_RGB(117, 82, 133, 1);
    [self.navigationController.navigationBar addSubview:statusBarView];

    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];

    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    //UISwipeGestureRecognizer *Swipe;
    
   // Swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(GSwipeRight:)];
   // Swipe.direction = UISwipeGestureRecognizerDirectionRight;
   // [self.view addGestureRecognizer:Swipe];
    
    UILabel *Title_lb = [[UILabel alloc] init];

    
    UIImage* image = [UIImage imageNamed:@"logosmall"];
    CGRect frame = CGRectMake(0, 0, 77, 28);
    
    UIImageView* TopLogo = [[UIImageView alloc] initWithFrame:frame];
    [TopLogo setImage:image];
    
    UIButton *homeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [homeBtn setImage:[UIImage imageNamed:@"homeicon"] forState:UIControlStateNormal];
    [homeBtn setImage:[UIImage imageNamed:@"homeicon"] forState:UIControlStateHighlighted];
    homeBtn.frame = CGRectMake(5, 0, 17, 44);
    //[homeBtn addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleLeftMenu) forControlEvents:UIControlEventTouchUpInside];
    //[homeBtn addTarget:self action:@selector(SwipeRight:) forControlEvents:UIControlEventTouchUpInside];
    [homeBtn setShowsTouchWhenHighlighted:YES];
    
    UIView *parentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 44)];
    parentView.backgroundColor = [UIColor clearColor];
    
    homeBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [homeBtn setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin];
    
    
    [parentView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin];
    parentView.autoresizesSubviews = YES;
    
    
    [parentView addSubview:homeBtn];
    
    if (level > 0) {
        
        [parentView setFrame:CGRectMake(0, 0, 170, 44)];
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //[parentView setBackgroundColor:[UIColor blackColor]];

        
        [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
        
        [backBtn  addTarget:self action:@selector(OnBack)   forControlEvents:UIControlEventTouchUpInside];
        backBtn.frame = CGRectMake(30, 0, 170, 44);
        //[backBtn setBackgroundColor:[UIColor redColor]];
        [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -155.0, 0, 0)];
        [backBtn setShowsTouchWhenHighlighted:YES];
        
        
        [parentView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin];
        parentView.autoresizesSubviews = YES;

        backBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [backBtn setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin];

        [parentView addSubview:backBtn];
        [Title_lb setFrame:CGRectMake(50, 0,200, 44)];

        
    }else{
        [Title_lb setFrame:CGRectMake(30, 0,200, 44)];
    }
    
   // UILabel *Title_lb = [[UILabel alloc] initWithFrame:CGRectMake(50, 0,150, 44)];
    
    [Title_lb setText:Label];
    Title_lb.textAlignment = NSTextAlignmentLeft;
    [Title_lb setTextColor:[UIColor whiteColor]];
    //[Title_lb setBackgroundColor:[UIColor blackColor]];
    [Title_lb setFont:[UIFont fontWithName:FontName size:14.0]];
    
    [Title_lb setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin];
    
    [parentView addSubview:Title_lb];


    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:parentView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:TopLogo];

    
}






-(void)MakeaCall:(NSString*)phone_number
{
   
    NSString *phNo = phone_number;
    phNo = [phNo stringByReplacingOccurrencesOfString:@" " withString:@""];

    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
    
    if (phNo.length>0) {
        
    
        if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
            [[UIApplication sharedApplication] openURL:phoneUrl];
        } else
        {
            UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [calert show];
        }
    }else{
        UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Number is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [calert show];
    }
}


#pragma mark - Custom Title

-(void)SetViewTitle:(NSString *)Label
{
    UILabel *Title_lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,170, 40)];
    [Title_lb setText:Label];
    Title_lb.textAlignment = NSTextAlignmentLeft;
    [Title_lb setTextColor:[UIColor whiteColor]];
    //[Title_lb setBackgroundColor:[UIColor blackColor]];
    [Title_lb setFont:[UIFont fontWithName:FontName size:14.0]];
    self.navigationItem.titleView = Title_lb;
}



-(void)SwipeRight:(id)sender
{
    NSLog(@"Leftmenu");
}


- (void) OnDismiss:(id)sender {
	
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void) OnBack {
    NSLog(@"Back");
	//[self.navigationController popViewControllerAnimated:true];
}


//-------------------------------------------------------//

-(NSString *) stringByStrippingHTML:(NSString *)Str
{
    NSRange r;
    NSString *s = Str;
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}


-(NSString *) ChangeDateFormat:(NSString *)Str
{
    
    NSString *Date = Str;
    
    if ([Date length]>0) {
        NSArray *DateTime = [Date componentsSeparatedByString:@"T"];
        NSString *Date;
        NSString *Time;
        @try {
            Date  = [DateTime objectAtIndex:0];
            Time = [DateTime objectAtIndex:1];
            
        }
        @catch (NSException *exception) {
            Date  = @"";
            Time = @"";
        }
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *theDate = [dateFormat dateFromString:Date];
        [dateFormat setDateFormat:@"dd-MM-yyyy"];
        
        NSString *CreateTime = Time;
        
        if ([CreateTime length]>0) {
            NSString *CreateDate = [NSString stringWithFormat:@"%@ %@",[dateFormat stringFromDate:theDate],CreateTime];
            return CreateDate;
            
        }else{
            
            NSString *CreateTime = @"";
            
            NSString *CreateDate = [NSString stringWithFormat:@"%@ %@",[dateFormat stringFromDate:theDate],CreateTime];
            return CreateDate;
            
            
        }
        
    }
}

-(CGFloat) CalculateDistance:(CLLocation*) StartLocation EndLocation:(CLLocation*) EndLocation
{
    
    CLLocation *newLocation = StartLocation;
    CLLocation *current = EndLocation;
    
    CLLocationDistance Miles = [current distanceFromLocation:newLocation] * 0.000621371;
    //[NSString stringWithFormat:@"%f",kilometers1];
    
    NSLog(@"Distance : %f",Miles);
    
    return Miles;
    
}



- (NSString*)remaningTime:(NSDate*)startDate endDate:(NSDate*)endDate{
    
    NSDateComponents *components;
    NSInteger days;
    NSInteger hour;
    NSInteger minutes;
    NSString *durationString;
    
    
    components = [[NSCalendar currentCalendar] components: NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute
                                                 fromDate: startDate toDate: endDate options: 0];
    days = [components day];
    hour=[components hour];
    minutes=[components minute];
    
    if(days>0){
        
        if(days>1){
            durationString=[NSString stringWithFormat:@"%ld days",(long)days];
        }
        else{
            durationString=[NSString stringWithFormat:@"%ld day",(long)days];
            
        }
        return durationString;
    }
    
    if(hour>0){
        
        if(hour>1){
            durationString=[NSString stringWithFormat:@"%ld hours",(long)hour];
        }
        else{
            durationString=[NSString stringWithFormat:@"%ld hour",(long)hour];
            
        }
        return durationString;
    }
    
    if(minutes>0){
        
        if(minutes>1){
            durationString=[NSString stringWithFormat:@"%ld minutes",(long)minutes];
        }
        else{
            durationString=[NSString stringWithFormat:@"%ld minute",(long)minutes];
            
        }
        return durationString;
    }
    
    return @"";
}






@end



@implementation UIImageView (UIUtility)

- (void)setImageWithUrl:(NSString*)url
{
    [self performSelectorInBackground:@selector(downloadImage:) withObject:url];
}

- (void) downloadImage:(NSString*) imgUrl
{
	
	NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imgUrl]];
	UIImage* image = [[UIImage alloc] initWithData:imageData];
    
    if (image != nil) {
        
		[self performSelectorOnMainThread:@selector(updateImage:) withObject:image waitUntilDone:YES];
	}
    
}

-(void) updateImage:(UIImage*) img {
    
    
	self.alpha = 0.0;
	[self setImage:img];
	
	[UIView animateWithDuration:0.1 							  
					 animations:^{   
						 self.alpha = 1.0;
					 }];
	
}

@end
