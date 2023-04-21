//
//  NotificationTableViewCell.h
//  The Morning Kitchen
//
//  Created by deepak jain on 21/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (strong, nonatomic) IBOutlet UILabel *lblNotification;
@property (strong, nonatomic) IBOutlet UIView *cellView;

@end
