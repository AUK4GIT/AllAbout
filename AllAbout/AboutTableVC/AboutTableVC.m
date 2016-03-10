//
//  AboutTableVC.m
//  AllAbout
//
//  Created by Uday Kiran Ailapaka on 09/03/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//

#import "AboutTableVC.h"
#import "Helper.h"
#import "AboutTableCell.h"
#import "About.h"

@interface AboutTableVC ()
@property(nonatomic, strong) NSArray *detailsArray;
@property(nonatomic, strong) Helper *helper;
@property(nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@end

@implementation AboutTableVC
static NSString * const reuseIdentifier = @"AboutTableCell";

- (void)viewDidLoad {
    [super viewDidLoad];

    self.clearsSelectionOnViewWillAppear = NO;
    
    /*
        configure tableView
     */
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 60.0;
    [self.tableView registerClass:[AboutTableCell class] forCellReuseIdentifier:reuseIdentifier];
    
    /*
        Initialize the refresh control.
     */
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor lightGrayColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self
                            action:@selector(fetchDataFromServer)
                  forControlEvents:UIControlEventValueChanged];
    
    self.helper = [[Helper alloc] init];
    [self fetchDataFromDB];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Methods

/**
    fetch data from server
 **/
- (void)fetchDataFromServer {
    [self.helper cancelDataTask];
    [self.activityIndicator startAnimating];
    [self.helper fetchDataFromService:^(NSArray *details){
        if (details.count > 0) {
            self.detailsArray = details;
            [self.tableView reloadData];
        } else {
            //show Alert. No Albums found
        }
        [self.refreshControl endRefreshing];
        [self.activityIndicator stopAnimating];
    }];
}

//checks for existing data in the database else fetch the albums from service.
- (void)fetchDataFromDB {
    
    [self.helper fetchDataFromDB:^(NSArray *dbDetails) {
        if (dbDetails.count > 0) {
            self.detailsArray = dbDetails;
            [self.tableView reloadData];
        } else {
            [self fetchDataFromServer];
        }
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.detailsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AboutTableCell *cell = (AboutTableCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    About *about = (About *)self.detailsArray[indexPath.row];
    cell.titleLabel.text = about.title;
    cell.descriptionLabel.text = about.aboutDescription;
//    cell.titleLabel.text = about.title;
    NSLog(@"%@:    %@: ",about.title,about.aboutDescription);
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
