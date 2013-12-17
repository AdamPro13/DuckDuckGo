//
//  DDGSearchResultsViewController.m
//  DuckDuckGo
//
//  Created by Adam Proschek on 12/15/13.
//  Copyright (c) 2013 Adam Proschek. All rights reserved.
//

#import "DDGSearchResultsViewController.h"
#import "DDGSearchResultCell.h"
#import "DDGTopicCell.h"
#import "DDGRelatedTopic.h"
#import "DDGTopic.h"
#import "DDGDetailViewController.h"

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
    if (!self.searchResults)
    {
        [self.handler sendRequest];
        
        [self addIndicatorView];
    }
    
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
        
        cell.topic = topic;
        cell.textLabel.text = topic.text;
        
        return cell;
    }
    else if ([[self.searchResults objectAtIndex:indexPath.row] isKindOfClass:[DDGTopic class]])
    {
        static NSString *CellIdentifier = @"TopicCell";
        DDGTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil)
        {
            cell = [[DDGTopicCell alloc] init];
        }
        
        DDGTopic *topic = [self.searchResults objectAtIndex:indexPath.row];
        cell.topic = topic;
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

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
    
    if ([[tableView cellForRowAtIndexPath:indexPath] isKindOfClass:[DDGTopicCell class]])
    {
        DDGTopicCell *cell = (DDGTopicCell *)[tableView cellForRowAtIndexPath:indexPath];
        DDGSearchResultsViewController *resultsView = [[DDGSearchResultsViewController alloc] init];
        resultsView.searchString = cell.topic.name;
        resultsView.searchResults = cell.topic.topics;
        
        [self.navigationController pushViewController:resultsView animated:YES];
    }
}

#pragma mark - Request Delegate

- (void)requestEndedWithData:(id)data andRequest:(NSString *)request
{
    [self.indicatorView stopAnimating];
    if ([data isKindOfClass:[NSArray class]])
    {   
        self.searchResults = data;
        [self.tableView reloadData];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[DDGDetailViewController class]])
    {
        DDGDetailViewController *destination = segue.destinationViewController;
        DDGSearchResultCell *cell = sender;
        destination.topic = cell.topic;
    }
}

- (void)addIndicatorView
{
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.indicatorView.color = [UIColor redColor];
    CGFloat centerX = (self.view.frame.origin.x + self.view.frame.size.width - self.indicatorView.frame.size.width)/2.0;
    CGFloat centerY = (self.view.frame.origin.y + self.view.frame.size.height - self.indicatorView.frame.size.height)/2.0;
    CGRect newPosition = CGRectMake(centerX, centerY, self.indicatorView.frame.size.width, self.indicatorView.frame.size.height);
    self.indicatorView.frame = newPosition;
    [self.view addSubview:self.indicatorView];
    
    [self.indicatorView startAnimating];
}

- (void)customizeAppearance
{
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
}

@end
