//
//  Helper.h
//  AllAbout
//
//  Created by Uday Kiran Ailapaka on 09/03/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//

/**
 This class is interface for all webservices the app connects to.
 **/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Helper : NSObject
@property(nonatomic, weak) NSURLSessionDataTask *dataTask;
@property(nonatomic, weak) NSURLSessionDownloadTask *downloadPhotoTask;

- (void)fetchDataFromDB: (void (^)(NSArray *))completionBlock;
- (void)fetchCountryFromDB:(void (^)(NSArray *))completionBlock;
- (void)fetchDataFromService:(void (^)(NSArray *))completionBlock;
- (void)fetchImageWithURLString:(NSString *)urlString completionHandler:( void (^)(UIImage *))completionBlock;
- (void)cancelDataTask;
@end
