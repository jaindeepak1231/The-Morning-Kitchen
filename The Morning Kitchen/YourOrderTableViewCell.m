//
//  YourOrderTableViewCell.m
//  The Morning Kitchen
//
//  Created by deepak jain on 23/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "YourOrderTableViewCell.h"

@implementation YourOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.viewCell.backgroundColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
