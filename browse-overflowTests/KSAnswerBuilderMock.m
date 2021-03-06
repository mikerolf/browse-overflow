//
//  KSAnswerBuilderMock.m
//  browse-overflow
//
//  Created by Mauricio Hanika on 24.03.13.
//  Copyright (c) 2013 Mauricio Hanika. All rights reserved.
//

#import "KSAnswerBuilderMock.h"
#import "KSAnswer.h"
#import "KSQuestion.h"

@implementation KSAnswerBuilderMock

- (BOOL) addAnswersToQuestion:(KSQuestion *)question fromJSON:(NSString *)json error:(NSError *__autoreleasing *)error
{
  self.questionToFillAnswersFor = question;
  for (KSAnswer *answer in self.answersToSet)
  {
    [question addAnswer:answer];
  }
  
  self.JSON = json;
  *error = self.errorToSet;
  
  return self.errorToSet == nil;
}

@end
