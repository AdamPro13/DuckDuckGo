//
//  DDGSearchResultsViewController.m
//  DuckDuckGo
//
//  Created by Adam Proschek on 12/15/13.
//  Copyright (c) 2013 Adam Proschek. All rights reserved.
//

#import "DDGSearchResultsViewController.h"
#import "DDGSearchResultCell.h"
#import "DDGRelatedTopic.h"
#import "DDGTopic.h"

@interface DDGSearchResultsViewController ()

@end

@implementation DDGSearchResultsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = self.searchString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.searchResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[self.searchResults objectAtIndex:indexPath.row] isKindOfClass:[DDGRelatedTopic class]])
    {
        static NSString *CellIdentifier = @"SearchResultCell";
        DDGSearchResultCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil)
        {
            cell = [[DDGSearchResultCell alloc] init];
        }
        
        DDGRelatedTopic *topic = [self.searchResults objectAtIndex:indexPath.row];
        
        if (topic.image == nil)
        {
            cell.icon.image = [UIImage imageNamed:@"missingIcon.png"];
        }
        else
        {
            cell.icon.image = topic.image;
        }
        
        cell.textView.text = topic.text;
        
        return cell;
    }
    else if ([[self.searchResults objectAtIndex:indexPath.row] isKindOfClass:[DDGTopic class]])
    {
        static NSString *CellIdentifier = @"TopicCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] init];
        }
        
        DDGTopic *topic = [self.searchResults objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ (%lu)",topic.name, (unsigned long)[topic.topics count]];
        
        return cell;
    }
    else
    {
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] init];
        }
        
        return cell;
    }
}

- (void)requestEndedWithData:(id)data andRequest:(NSString *)request
{
    if ([data isKindOfClass:[NSArray class]])
    {
        NSLog(@"Nav item: %@", self.navigationItem);
        NSLog(@"Nav controller: %@", self.navigationController.navigationBar);
        
        self.searchResults = data;
        [self.tableView reloadData];
    }
}

- (void)customizeAppearance
{
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
}

@end
