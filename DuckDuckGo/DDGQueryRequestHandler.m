//
//  DDGQueryRequestHandler.m
//  DuckDuckGo
//
//  Created by Adam Proschek on 12/15/13.
//  Copyright (c) 2013 Adam Proschek. All rights reserved.
//

#import "DDGQueryRequestHandler.h"
#import "DDGRelatedTopic.h"
#import "DDGTopic.h"

@implementation DDGQueryRequestHandler

+ (DDGQueryRequestHandler *)queryHandlerForSender:(NSObject<DDGRequestDelegate> *)sender forString:(NSString *)searchString
{
    DDGQueryRequestHandler *handler = [DDGQueryRequestHandler alloc];
    handler.delegate = sender;
    NSMutableString *requestString = [[NSMutableString alloc] initWithString:[DDGQueryRequestHandler baseURL]];
    [requestString appendString:searchString];
    [requestString appendString:[DDGQueryRequestHandler jsonFormatString]];
    [requestString appendString:[DDGQueryRequestHandler tParameter]];
    handler.requestString = requestString;
    
    return handler;
}

- (void)requestDidFinishWithData:(id)data
{
    if ([data isKindOfClass:[NSDictionary class]])
    {
        NSArray *resultsDictionary = [data valueForKey:@"RelatedTopics"];
        NSMutableArray *results = [[NSMutableArray alloc] init];
        
        for (NSDictionary *resultDict in resultsDictionary)
        {
            if ([resultDict valueForKey:@"Text"])
            {
                DDGRelatedTopic *topic = [self parseResultDictionary:resultDict];
                [results addObject:topic];
            }
            else
            {
                DDGTopic *topic = [self parseTopicDictionary:resultDict];
                [results addObject:topic];
            }
        }
        
        [self.delegate requestEndedWithData:results andRequest:self.requestString];
    }
}

- (DDGRelatedTopic *)parseResultDictionary:(NSDictionary *)resultDictionary
{
    DDGRelatedTopic *topic = [[DDGRelatedTopic alloc] init];
    topic.text = [resultDictionary valueForKey:@"Text"];
    
    NSDictionary *iconDict = [resultDictionary valueForKey:@"Icon"];
    NSString *imageURL = [iconDict valueForKey:@"URL"];
    topic.imageURL = [NSURL URLWithString:imageURL];
    topic.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:topic.imageURL]];
    
    return topic;
}

- (DDGTopic *)parseTopicDictionary:(NSDictionary *)topicDictionary
{
    DDGTopic *topic = [[DDGTopic alloc] init];
    topic.topics = [[NSMutableArray alloc] init];
    topic.name = [topicDictionary valueForKey:@"Name"];
    NSArray *associatedTopics = [topicDictionary valueForKey:@"Topics"];
    
    for (NSDictionary *associatedTopicDictionary in associatedTopics)
    {
        DDGRelatedTopic *relatedTopic = [self parseResultDictionary:associatedTopicDictionary];
        [topic.topics addObject:relatedTopic];
    }
    
    return topic;
}

- (void)sendRequest
{
    [self sendRequestWithString:self.requestString];
}

@end
