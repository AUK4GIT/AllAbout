//
//  About+CoreDataProperties.h
//  AllAbout
//
//  Created by Uday Kiran Ailapaka on 09/03/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "About.h"

NS_ASSUME_NONNULL_BEGIN

@interface About (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *aboutDescription;
@property (nullable, nonatomic, retain) NSString *imageURL;
@property (nullable, nonatomic, retain) Country *country;

@end

NS_ASSUME_NONNULL_END
