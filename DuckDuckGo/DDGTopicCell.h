//
//  DDGTopicCell.h
//  DuckDuckGo
//
//  Created by Adam Proschek on 12/16/13.
//  Copyright (c) 2013 Adam Proschek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDGTopic.h"

@interface DDGTopicCell : UITableViewCell

@property (strong, nonatomic) DDGTopic *topic;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;

@end
