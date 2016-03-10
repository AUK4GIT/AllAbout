//
//  AboutTableCell.m
//  AllAbout
//
//  Created by Uday Kiran Ailapaka on 10/03/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//

#import "AboutTableCell.h"

@implementation AboutTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.translatesAutoresizingMaskIntoConstraints = false;
        [self layoutUIElementsOnCell];
    }
    return self;
}

/*
    Creates subviews on cells and add constraints.
 */
- (void) layoutUIElementsOnCell {
    
    self.titleLabel = [[UILabel alloc] init];
    [self.titleLabel setTextColor:[UIColor blackColor]];
    [self.titleLabel setBackgroundColor:[UIColor colorWithHue:32 saturation:100 brightness:63 alpha:1]];
    [self.titleLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:18.0f]];
    [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.titleLabel];
    
    self.descriptionLabel = [[UILabel alloc] init];
    [self.descriptionLabel setTextColor:[UIColor darkGrayColor]];
    [self.descriptionLabel setBackgroundColor:[UIColor colorWithHue:66 saturation:100 brightness:63 alpha:1]];
    [self.descriptionLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:18.0f]];
    [self.descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.descriptionLabel];

}

- (void)awakeFromNib {
    // Initialization code
    [self layoutUIElementsOnCell];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
