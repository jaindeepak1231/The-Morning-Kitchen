//
//  IteamListTableViewCell.h
//  The Morning Kitchen
//
//  Created by deepak jain on 21/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IteamListTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgFood;
@property (strong, nonatomic) IBOutlet UILabel *lblMenu;
@property (strong, nonatomic) IBOutlet UILabel *lblrs;

@property (strong, nonatomic) IBOutlet UIView *viewOutofBg;
@property (strong, nonatomic) IBOutlet UILabel *lblOutofStock;

@end
