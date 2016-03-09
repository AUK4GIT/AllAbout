//
//  ModelCoordinator.m
//  AllAbout
//
//  Created by Uday Kiran Ailapaka on 09/03/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//

#import "ModelCoordinator.h"
#import "AppDelegate.h"
#import "About.h"
#import "Country.h"

@implementation ModelCoordinator
{
    AppDelegate *appDelegate;
    NSManagedObjectContext *managedContext;
}
- (id)init{
    if (self = [super init]) {
        appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        managedContext = appDelegate.managedObjectContext;
    }
    return self;
}
@end
