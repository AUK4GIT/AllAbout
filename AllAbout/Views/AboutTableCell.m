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

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        
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
    
    UIImage *placehoderImage = [UIImage imageNamed:@"placeholder.png"];
    self.imgView = [[UIImageView alloc] initWithImage:placehoderImage];
    [self.imgView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.imageView];
    
}

- (void)awakeFromNib {
    // Initialization code
    [self layoutUIElementsOnCell];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
//    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    [super updateConstraints];
    
    /*
     Add constraints: 'horizantal center and top' to imageView
     */
    NSLayoutConstraint *imgTopLayoutConstr = [NSLayoutConstraint constraintWithItem:self.imgView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:8.0];
    NSLayoutConstraint *centerYConstr = [NSLayoutConstraint constraintWithItem:self.imgView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];

    [self addConstraints:@[imgTopLayoutConstr, centerYConstr]];

}

@end
