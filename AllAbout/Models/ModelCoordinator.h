//
//  ModelCoordinator.h
//  AllAbout
//
//  Created by Uday Kiran Ailapaka on 09/03/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//

/**
 This class is the interface for all database interactions.
 **/

#import <Foundation/Foundation.h>

@interface ModelCoordinator : NSObject

- (NSArray *)fetchData;
- (void)saveToDBDetails:(NSArray *)details withCountry:(NSString *)country;
- (NSArray *)fetchCountryData;
@end
