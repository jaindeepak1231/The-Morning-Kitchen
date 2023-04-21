//
//  UIAlertview+Alert.h
//  Media App
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIAlertView (utils)

+ (void)showInfo:(NSString *)msg WithTitle:(NSString *)title Delegate:(id)sender;

+ (void)showInfo:(NSString *)msg WithTitle:(NSString *)title WithTag:(NSInteger)tag Delegate:(id)sender;

+ (void)showAlertInfo:(NSString *)msg WithTitle:(NSString *)title Delegate:(id)sender;

@end
