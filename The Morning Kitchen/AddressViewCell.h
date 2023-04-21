//
//  AddressViewCell.h
//  The Morning Kitchen
//
//  Created by deepak jain on 21/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lblAddress;

@property (strong, nonatomic) IBOutlet UIButton *btnEditClicked;
@property (strong, nonatomic) IBOutlet UIButton *btnDeleteClicked;

@end
