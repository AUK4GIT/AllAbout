//
//  ViewController.m
//  AllAbout
//
//  Created by Uday Kiran Ailapaka on 09/03/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//

#import "ViewController.h"
#import "AboutTableVC.h"

@interface ViewController ()
@property(nonatomic, strong) AboutTableVC *tableVC;
@property(nonatomic, strong) UINavigationController *navigationController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.tableVC = [[AboutTableVC alloc] init];
    /*
        Embed tableVC in NavigationController
     */
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.tableVC];
    [self.view addSubview:self.navigationController.view];

    /*
        Make navigationController's view as child inorder to receive rotation events
     */
    [self addChildViewController:self.navigationController];
    
    [self setupUISettingsForTheApp];
    
    self.tableVC.title = @"All About";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 overridden method to add custom constarints programmatically
 **/
- (void)updateViewConstraints
{
    [super updateViewConstraints];
    [self layoutTableViewFullScreen];
}

#pragma mark - Custom Methods

/*
 Set the theme for the app
 */
- (void)setupUISettingsForTheApp{
    [[UILabel appearance] setFont:[UIFont fontWithName:@"Helvetica Neue" size:16.0]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:true];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont fontWithName:@"Helvetica Neue" size:16.0]}];
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
}

/**
    Add constraints to tableView to fit full screen.
 **/
- (void)layoutTableViewFullScreen {
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.navigationController.view
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.navigationController.view
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.navigationController.view
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.navigationController.view
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:0.0]];
}

@end
