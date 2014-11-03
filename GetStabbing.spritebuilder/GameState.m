//
//  GameState.m
//  GetStabbing
//
//  Created by Harlan Kellaway on 11/2/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Constants.h"
#import "GameState.h"

static NSString *const GAME_STATE_HIGH_SCORE_KEY = @"GameStateHighScoreKey";

@implementation GameState

+(instancetype)sharedInstance
{
    // structure used to test whether the block has completed or not
    static dispatch_once_t p = 0;
    
    // initialize sharedObject as nil (first call only)
    __strong static id _sharedObject = nil;
    
    // executes a block object once and only once for the lifetime of an application
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    // returns the same object each time
    return _sharedObject;
}

- (instancetype)init
{
    self = [super init];
    
    if(self)
    {
        // high score
        NSString *currentHighScore = [[NSUserDefaults standardUserDefaults]objectForKey:GAME_STATE_HIGH_SCORE_KEY];
        
        // if no high score recorded
        if(currentHighScore == nil)
        {
            [self setHighScore:0];
        }
        
        // save defaults
        [[NSUserDefaults standardUserDefaults]synchronize];
        
    }
    
    return self;
}

# pragma mark - setter overides
- (void)setHighScore:(NSInteger)highScore
{
    _highScore = highScore;
    
    NSNumber *highScoreNSNumber = [NSNumber numberWithInt:highScore];
    
    // store change
    [[NSUserDefaults standardUserDefaults] setObject:highScoreNSNumber forKey:GAME_STATE_HIGH_SCORE_KEY];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

@end
