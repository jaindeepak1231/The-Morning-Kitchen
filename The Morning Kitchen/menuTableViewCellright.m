//
//  menuTableViewCellright.m
//  The Morning Kitchen
//
//  Created by deepak jain on 19/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "menuTableViewCellright.h"
#import "Globel.h"

@implementation menuTableViewCellright

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.lblbg.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(20.0, 20.0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.lblbg.bounds;
    maskLayer.path  = maskPath.CGPath;
    self.lblbg.layer.mask = maskLayer;
    
    UIColor*col = GET_COLOR_WITH_RGB(117, 82, 133, 1);
    self.lblbg.backgroundColor = [col colorWithAlphaComponent:.7];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
