//
//  Question.m
//  picGuess
//
//  Created by Yingwei Fan on 3/2/16.
//  Copyright © 2016 Yingwei Fan. All rights reserved.
//

#import "Question.h"

@implementation Question
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if(self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)questionWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

+ (NSArray*)questions {
    NSArray* array = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"questions" ofType:@"plist"]];
    NSMutableArray* arrayM = [NSMutableArray array];
    for(NSDictionary* dict in array) {
        [arrayM addObject:[self questionWithDict:dict]];
    }
    return arrayM;
}

//If the model is self defined, this function is needed to debug conveniently
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p> {answer: %@, icon: %@, title: %@, options: %@}",self.class, self, self.answer, self.icon, self.title, self.options];
}

- (void) randomOptions {
    self.options = [self.options sortedArrayUsingComparator:^NSComparisonResult(NSString* str1, NSString* str2) {
        if (arc4random_uniform(2)) {
            return [str1 compare:str2];
        }
        else {
            return [str2 compare:str1];
        }
    }];
}
@end
