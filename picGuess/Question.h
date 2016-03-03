//
//  Question.h
//  picGuess
//
//  Created by Yingwei Fan on 3/2/16.
//  Copyright © 2016 Yingwei Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject
@property (nonatomic,copy) NSString* answer;
@property (nonatomic,copy) NSString* icon;
@property (nonatomic,copy) NSString* title;
@property (nonatomic,strong) NSArray* options;

- (instancetype)initWithDict:(NSDictionary*) dict;
+ (instancetype)questionWithDict:(NSDictionary*) dict;
+ (NSArray*)questions;

- (NSString *)description;
- (void) randomOptions;
@end
