//
//  DDGRelatedTopic.h
//  DuckDuckGo
//
//  Created by Adam Proschek on 12/15/13.
//  Copyright (c) 2013 Adam Proschek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDGRelatedTopic : NSObject

@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *text;

@end
