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

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
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
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.imgView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.imgView];
    
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
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imgView
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:1.0
                                                                  constant:8.0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imgView
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.titleLabel
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:8.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeading
                                                                multiplier:1.0
                                                                  constant:8.0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.descriptionLabel
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:8.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeading
                                                                multiplier:1.0
                                                                  constant:8.0]];

    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:8.0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:8.0]];

    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.descriptionLabel
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:8.0]];


}

@end
