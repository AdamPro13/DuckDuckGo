//
//  DDGDetailViewController.h
//  DuckDuckGo
//
//  Created by Adam Proschek on 12/16/13.
//  Copyright (c) 2013 Adam Proschek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDGRelatedTopic.h"

@interface DDGDetailViewController : UIViewController

@property (strong, nonatomic) DDGRelatedTopic *topic;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextView *detailTextView;

@end
