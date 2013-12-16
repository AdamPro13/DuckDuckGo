//
//  DDGTopic.h
//  DuckDuckGo
//
//  Created by Adam Proschek on 12/16/13.
//  Copyright (c) 2013 Adam Proschek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDGTopic : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *topics;

@end
