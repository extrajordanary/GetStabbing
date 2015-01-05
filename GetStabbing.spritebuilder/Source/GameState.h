//
//  GameState.h
//  GetStabbing
//
//  Created by Harlan Kellaway on 11/2/14.
//  Copyright (c) 2014 Harlan Kellaway. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameState : NSObject

@property (nonatomic, assign) NSInteger latestScore;
@property (nonatomic, assign) NSInteger highScore;

+ (instancetype)sharedInstance;

@end