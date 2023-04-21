//
//  CartIteamTableViewCell.h
//  The Morning Kitchen
//
//  Created by deepak jain on 22/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartIteamTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *cellView;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UILabel *lblIteam;
@property (strong, nonatomic) IBOutlet UILabel *lblUnderline;

@property (strong, nonatomic) IBOutlet UIView *ceView;
@property (strong, nonatomic) IBOutlet UILabel *lblExtraItmPrice;
@property (strong, nonatomic) IBOutlet UILabel *lblExtraIteam;

@property (strong, nonatomic) IBOutlet UIButton *btnEditClicked;
@property (strong, nonatomic) IBOutlet UIButton *btnDeleteClicked;

@end
