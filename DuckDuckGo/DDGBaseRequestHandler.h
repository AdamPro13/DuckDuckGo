//
//  DDGBaseRequestHandler.h
//  DuckDuckGo
//
//  Created by Adam Proschek on 12/15/13.
//  Copyright (c) 2013 Adam Proschek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DDGRequestDelegate <NSObject>

- (void)requestEndedWithData:(id)data andRequest:(NSString *)request;

@end

@interface DDGBaseRequestHandler : NSObject

@property (nonatomic, weak) NSObject<DDGRequestDelegate> *delegate;
@property (nonatomic, strong) NSString *requestString;

+ (NSString *)baseURL;
+ (NSString *)jsonFormatString;
+ (NSString *)tParameter;
- (void)sendRequestWithString:(NSString *)requestURLString;
- (void)requestDidFinishWithData:(id)data;
- (void)sendRequest;

@end
