//
//  IteamListTableViewCell.m
//  The Morning Kitchen
//
//  Created by deepak jain on 21/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "IteamListTableViewCell.h"
#import "Globel.h"

@implementation IteamListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.lblrs.textColor = GET_COLOR_WITH_RGB(33, 142, 58, 1);
    self.viewOutofBg.hidden = YES;
    
    UIColor*col = GET_COLOR_WITH_RGB(117, 82, 133, 1);
    self.viewOutofBg.backgroundColor = [col colorWithAlphaComponent:.7];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
