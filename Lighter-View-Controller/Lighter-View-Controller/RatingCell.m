//
//  RatingCell.m
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/30.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import "RatingCell.h"

static const int MaximumNumberOfStars = 5;
static const float InactiveStarOpacity = .2;


@implementation RatingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (UINib *)nib {
    return [UINib nibWithNibName:@"RatingCell" bundle:nil];
}

- (void)setRating:(double)rating {
    if (_rating == rating) return;
    
    _rating = rating;
    [self updateForRating:rating];
}

- (void)updateForRating:(double)rating {
    NSUInteger numberOfStars = (NSUInteger) ceilf((float) (rating * MaximumNumberOfStars));
    for (NSUInteger idx = 0; idx < MaximumNumberOfStars; idx++) {
        UIView *starView = self.contentView.subviews[idx];
        starView.alpha = numberOfStars > idx ? 1 : InactiveStarOpacity;
    }

}

@end
