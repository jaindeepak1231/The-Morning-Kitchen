//
//  LeftMenuTableViewCell.m
//  The Morning Kitchen
//
//  Created by Saturncube on 18/01/17.
//  Copyright © 2017 Saturncube. All rights reserved.
//

#import "LeftMenuTableViewCell.h"
#import "Globel.h"

@implementation LeftMenuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.lblMenu.textColor = [UIColor purpleColor];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
