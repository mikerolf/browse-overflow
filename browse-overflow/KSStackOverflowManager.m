//
//  KSStackOverflowManager.m
//  browse-overflow
//
//  Created by Mauricio Hanika on 05.11.12.
//  Copyright (c) 2012 Mauricio Hanika. All rights reserved.
//

#import "KSStackOverflowManager.h"
#import "KSStackOverflowCommunicator.h"
#import "KSTopic.h"

NSString *KSStackOverflowManagerError = @"KSStackOverflowManagerError";

@implementation KSStackOverflowManager

@synthesize communicator = _communicator;
@synthesize delegate = _delegate;

- (void) setDelegate:(id<KSStackOverflowManagerDelegate>)delegate
{
  if (delegate != nil && ! [delegate conformsToProtocol:@protocol(KSStackOverflowManagerDelegate)])
  {
    [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Delegate object does not conform to the delegate protocol" userInfo:nil] raise];
  }
  
  _delegate = delegate;
}

- (void) fetchQuestionsOnTopic:(KSTopic *)topic
{
  [self.communicator searchForQuestionsWithTag:[topic tag]];
}

- (void) searchingForQuestionsFailedWithError:(NSError *)error
{
  NSDictionary *errorInfo = @{ NSUnderlyingErrorKey: error };
  NSError *reportableError = [NSError errorWithDomain:KSStackOverflowManagerError code:kKSStackOverflowManagerErrorQuestionSearchCode userInfo:errorInfo];
  
  [_delegate fetchingQuestionsOnTopic:nil failedWithError:reportableError];
}

@end