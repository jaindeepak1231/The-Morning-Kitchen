//
//  IteamShowInCartTableViewCell.m
//  The Morning Kitchen
//
//  Created by deepak jain on 22/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "IteamShowInCartTableViewCell.h"
#import "Globel.h"

@implementation IteamShowInCartTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lblPrice.textColor = GET_COLOR_WITH_RGB(33, 142, 58, 1);
    self.lblUnderline.backgroundColor = GET_COLOR_WITH_RGB(96, 65, 110, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
