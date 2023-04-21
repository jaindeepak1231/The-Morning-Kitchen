//
//  UIUtility.h
//  JobsApp
//
//  Created by Imran on 12/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LeftMenuVC.h"
#import "Globel.h"


@interface UIViewController (UIUtility)

-(void)SetbarBtns:(int)level Label:(NSString *)Label;

-(void)SetViewTitle:(NSString *)Label;
-(void)MakeaCall:(NSString*)phone_number;




-(NSString *) stringByStrippingHTML:(NSString *)Str;
-(NSString *) ChangeDateFormat:(NSString *)Str;
- (NSString*)remaningTime:(NSDate*)startDate endDate:(NSDate*)endDate;



@end


@interface UIImageView (UIUtility)

- (void)setImageWithUrl:(NSString*)url;

@end

