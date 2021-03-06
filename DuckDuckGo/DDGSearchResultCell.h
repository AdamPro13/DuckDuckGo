//
//  DDGSearchResultCell.h
//  DuckDuckGo
//
//  Created by Adam Proschek on 12/16/13.
//  Copyright (c) 2013 Adam Proschek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDGRelatedTopic.h"

@interface DDGSearchResultCell : UITableViewCell

@property (strong, nonatomic) DDGRelatedTopic *topic;
@property (strong, nonatomic) IBOutlet UIImageView *icon;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;

@end
