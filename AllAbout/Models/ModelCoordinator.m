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

/*
    fetches data from DB. Filters null data. Sorts Alphabetically
 */
- (NSArray *)fetchData {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"About"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title != ''"];
    NSSortDescriptor *sortD = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:true];
    request.sortDescriptors = @[sortD];
    request.predicate = predicate;
    NSError *error = nil;
    NSArray *results = [managedContext executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching About objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    return results == nil ? @[] : results;
}

/*
 fetches Country/Title from DB. 
 */
- (NSArray *)fetchCountryData {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Country"];
    NSError *error = nil;
    NSArray *results = [managedContext executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching About objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    return results == nil ? @[] : results;

}

- (void)saveToDBDetails:(NSArray *)details withCountry:(NSString *)countryName{
    [self deleteData:@"Country"];
    [self deleteData:@"About"];
    [self saveContext];
    
    NSEntityDescription *entityPerson = [NSEntityDescription entityForName:@"Country" inManagedObjectContext:managedContext];
    Country *country = (Country *)[[NSManagedObject alloc] initWithEntity:entityPerson insertIntoManagedObjectContext:managedContext];
    country.countryName = countryName;
    
    for (NSDictionary *about in details) {
            [country saveData:about withCountry:countryName];
    }
    [self saveContext];
}

/*
    Deletes the data of provided entity
 */
- (void)deleteData:(NSString *)entity {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entity];
    NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:request];
    
    NSError *deleteError = nil;
    [appDelegate.persistentStoreCoordinator executeRequest:delete withContext:managedContext error:&deleteError];
    if(deleteError){
        NSAssert(NO, @"Error Deleting Entity: %@\n%@", [deleteError localizedDescription], [deleteError userInfo]);
    }
}

/*
    Saves ManagedObjectContext Changes
 */
- (void)saveContext{
    NSError *error = nil;
    if ([managedContext save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
}

@end
