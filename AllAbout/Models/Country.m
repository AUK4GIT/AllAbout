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
    
            aboutObj.title = [aboutDict objectForKey:@"username"];
            aboutObj.aboutDescription = [aboutDict objectForKey:@"name"];
            aboutObj.imageURL = [aboutDict objectForKey:@"email"];
    
            [self setValue:aboutObj forKey:@"about"];
            
}

@end
