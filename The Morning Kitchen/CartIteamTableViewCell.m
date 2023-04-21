//
//  CartIteamTableViewCell.m
//  The Morning Kitchen
//
//  Created by deepak jain on 22/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "CartIteamTableViewCell.h"
#import "Globel.h"

@implementation CartIteamTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lblPrice.textColor = GET_COLOR_WITH_RGB(33, 142, 58, 1);
    self.lblExtraItmPrice.textColor = GET_COLOR_WITH_RGB(33, 142, 58, 1);
    self.cellView.backgroundColor = [UIColor whiteColor];
    self.ceView.backgroundColor = [UIColor whiteColor];
    _lblUnderline.frame = CGRectMake(0, _lblUnderline.frame.origin.y, _lblUnderline.frame.size.width, 0.5);
    _lblUnderline.backgroundColor = [UIColor purpleColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
