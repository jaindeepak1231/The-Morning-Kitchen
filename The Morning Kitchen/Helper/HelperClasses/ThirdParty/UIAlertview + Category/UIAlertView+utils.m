//
//  UIAlertview+Alert.m
//  Media App
//

#import "UIAlertView+utils.h"
#import <UIKit/UIKit.h>

@implementation UIAlertView (utils)

+ (void)showInfo:(NSString *)msg WithTitle:(NSString *)title Delegate:(id)sender{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:sender cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert show];
}

+ (void)showInfo:(NSString *)msg WithTitle:(NSString *)title WithTag:(NSInteger)tag Delegate:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:sender cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert show];
    alert.tag = tag;
}

+ (void)showAlertInfo:(NSString *)msg WithTitle:(NSString *)title Delegate:(id)sender{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:sender cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
	[alert show];
}


@end
