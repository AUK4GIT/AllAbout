//
//  Country.h
//  AllAbout
//
//  Created by Uday Kiran Ailapaka on 09/03/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Country : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
- (void)saveData:(NSDictionary *)about withCountry:(NSString *)country;

@end

NS_ASSUME_NONNULL_END

#import "Country+CoreDataProperties.h"
