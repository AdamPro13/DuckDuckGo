//
//  DDGSearchResultsViewController.h
//  DuckDuckGo
//
//  Created by Adam Proschek on 12/15/13.
//  Copyright (c) 2013 Adam Proschek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDGQueryRequestHandler.h"

@interface DDGSearchResultsViewController : UITableViewController <DDGRequestDelegate>

@property (nonatomic, strong) DDGQueryRequestHandler *handler;
@property (nonatomic, strong) NSString *searchString;
@property (nonatomic, strong) NSArray *searchResults;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@end
