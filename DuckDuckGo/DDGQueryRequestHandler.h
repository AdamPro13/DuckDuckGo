//
//  DDGQueryRequestHandler.h
//  DuckDuckGo
//
//  Created by Adam Proschek on 12/15/13.
//  Copyright (c) 2013 Adam Proschek. All rights reserved.
//

#import "DDGBaseRequestHandler.h"

@interface DDGQueryRequestHandler : DDGBaseRequestHandler

+ (DDGQueryRequestHandler *)queryHandlerForSender:(NSObject <DDGRequestDelegate> *)sender forString:(NSString *)searchString;

@end
