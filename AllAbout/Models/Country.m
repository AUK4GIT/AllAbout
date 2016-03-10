//
//  Country.m
//  AllAbout
//
//  Created by Uday Kiran Ailapaka on 09/03/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//

#import "Country.h"
#import "About.h"

@implementation Country

// Insert code here to add functionality to your managed object subclass
- (void)saveData:(NSDictionary *)aboutDict withCountry:(NSString *)country{
    
            NSEntityDescription *entity = [NSEntityDescription entityForName:@"About" inManagedObjectContext:self.managedObjectContext];
            About *aboutObj = (About *)[[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
    
    if ([aboutDict objectForKey:@"title"] == [NSNull null]) {
        aboutObj.title = @"No Data Available";
    } else {
        aboutObj.title = [aboutDict objectForKey:@"title"];
    }
    if ([aboutDict objectForKey:@"description"] == [NSNull null]) {
        aboutObj.aboutDescription = @"No Data Available";
    } else {
        aboutObj.aboutDescription = [aboutDict objectForKey:@"description"];
    }
    if ([aboutDict objectForKey:@"imageHref"] == [NSNull null]) {
        aboutObj.imageURL = @"";
    } else {
        aboutObj.imageURL = [aboutDict objectForKey:@"imageHref"];
    }
    
            [self setValue:aboutObj forKey:@"about"];
            
}

@end
