//
//  AboutTableCell.m
//  AllAbout
//
//  Created by Uday Kiran Ailapaka on 10/03/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//

#import "AboutTableCell.h"
#import "Helper.h"

@implementation AboutTableCell
{
    UIView *separator;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self layoutUIElementsOnCell];
    }
    return self;
}

/*
    Creates subviews on cells and add constraints.
 */
- (void) layoutUIElementsOnCell {
    [self.contentView setTranslatesAutoresizingMaskIntoConstraints:true];

    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"Title: ";
    [self.titleLabel setTextColor:[UIColor blackColor]];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-bold" size:15.0f]];
    [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.contentView addSubview:self.titleLabel];
    
    self.descriptionLabel = [[UILabel alloc] init];
    self.descriptionLabel.text = @"Description: ";
    [self.descriptionLabel setTextColor:[UIColor darkGrayColor]];
    [self.descriptionLabel setBackgroundColor:[UIColor clearColor]];
    [self.descriptionLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:15.0f]];
    [self.descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.descriptionLabel.numberOfLines = 0;
    self.descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.contentView addSubview:self.descriptionLabel];
    
    UIImage *placehoderImage = [UIImage imageNamed:@"placeholder.png"];
    self.imgView = [[UIImageView alloc] initWithImage:placehoderImage];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.imgView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.imgView];
    [self setNeedsUpdateConstraints];
    
    separator = [[UIView alloc] init];
    [separator setTranslatesAutoresizingMaskIntoConstraints:NO];
    separator.backgroundColor = [UIColor redColor];
    separator.alpha = 0.4;
    [self.contentView addSubview:separator];
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
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    [super updateConstraints];
    
    /*
     Add constraints: 'horizantal center and top' to imageView
     */
    
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imgView
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:8.0]];

    
    NSLayoutConstraint *widthC = [NSLayoutConstraint constraintWithItem:self.imgView
                                                               attribute:NSLayoutAttributeWidth
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:nil
                                                               attribute:NSLayoutAttributeNotAnAttribute
                                                              multiplier:1.0
                                                                constant:80.0];
    widthC.priority = UILayoutPriorityDefaultHigh;
    [self.contentView addConstraint:widthC];

    NSLayoutConstraint *heightC = [NSLayoutConstraint constraintWithItem:self.imgView
                                                               attribute:NSLayoutAttributeHeight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:nil
                                                               attribute:NSLayoutAttributeNotAnAttribute
                                                              multiplier:1.0
                                                                constant:80.0];
    heightC.priority = UILayoutPriorityDefaultHigh;
    [self.contentView addConstraint:heightC];

    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imgView
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeading
                                                                multiplier:1.0
                                                                  constant:8.0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:8.0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.imgView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:8.0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.titleLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:8.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.imgView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:8.0]];
    NSLayoutConstraint *bottomC = [NSLayoutConstraint constraintWithItem:separator
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                  toItem:self.descriptionLabel
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1.0
                                                                constant:20.0];
    bottomC.priority = UILayoutPriorityRequired;
    [self.contentView addConstraint:bottomC];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.titleLabel
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:8.0]];

    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.descriptionLabel
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:8.0]];
    NSLayoutConstraint *bottomConstr = [NSLayoutConstraint constraintWithItem:separator
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                       toItem:self.imgView
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:20.0];
    bottomConstr.priority = UILayoutPriorityDefaultHigh;
    [self.contentView addConstraint:bottomConstr];
    
    
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:separator
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:8.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:separator
                                                                 attribute:NSLayoutAttributeLeading
                                                                multiplier:1.0
                                                                  constant:-8.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:separator
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:8.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:separator
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:1.0]];

}

@end
