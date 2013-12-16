//
//  DDGBaseRequestHandler.m
//  DuckDuckGo
//
//  Created by Adam Proschek on 12/15/13.
//  Copyright (c) 2013 Adam Proschek. All rights reserved.
//

#import "DDGBaseRequestHandler.h"

@implementation DDGBaseRequestHandler

+ (NSString *)baseURL
{
    return @"http://api.duckduckgo.com/?q=";
}

+ (NSString *)jsonFormatString
{
    return @"&format=json";
}

+ (NSString *)tParameter
{
    return @"&t=AVAIDuckDuckGo";
}

- (void)sendRequestWithString:(NSString *)requestURLString
{
    NSLog(@"Request URL String: %@", requestURLString);
    
    NSURL *requestURL  = [NSURL URLWithString:requestURLString];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:requestURL];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
                               if (error)
                               {
                                   NSLog(@"Request Error: %@", [error localizedDescription]);
                               }
                               else
                               {
                                   NSError *jsonError;
                                   
                                   id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                                   
                                   if (jsonError)
                                   {
                                       NSLog(@"JSon error: %@", [jsonError localizedDescription]);
                                   }
                                   
                                   [self requestDidFinishWithData:object];
                               }
                           }];
}

- (void)requestDidFinishWithData:(NSDictionary *)resultDictionary
{
    //    Empty - Define for children
}

- (void)sendRequest
{
    //    Empty - Define for children
}

@end
