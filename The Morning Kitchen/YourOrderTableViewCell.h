//
//  YourOrderTableViewCell.h
//  The Morning Kitchen
//
//  Created by deepak jain on 23/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YourOrderTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lblOrderNo;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;
@property (strong, nonatomic) IBOutlet UILabel *lblOrderType;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UILabel *lblOrderStatus;
@property (strong, nonatomic) IBOutlet UIView *viewCell;

@end
