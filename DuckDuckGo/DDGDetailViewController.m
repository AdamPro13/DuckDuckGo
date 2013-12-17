//
//  DDGDetailViewController.m
//  DuckDuckGo
//
//  Created by Adam Proschek on 12/16/13.
//  Copyright (c) 2013 Adam Proschek. All rights reserved.
//

#import "DDGDetailViewController.h"

@interface DDGDetailViewController ()

@end

@implementation DDGDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.imageView.image = self.topic.image;
    self.detailTextView.text = self.topic.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
