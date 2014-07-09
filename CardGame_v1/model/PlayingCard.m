//
//  PlayingCard.m
//  CardGame_v1
//
//  Created by MENG-YI HSU on 7/5/14.
//  Copyright (c) 2014 Marcus. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()

@end

@implementation PlayingCard
@synthesize suit = _suit;

- (NSInteger)match:(NSArray *)otherCards {
    NSInteger score = 0;
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        } else if ([otherCard.suit isEqualToString: self.suit]) {
            score = 1;
        }
    }
    return score;
}

- (NSString *)contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuits {
    return @[@"♠️", @"♥️", @"♦️", @"♣️"] ;
}

+ (NSArray *)rankStrings {
    return @[@"A", @"2", @"3", @"4",@"5",@"6",@"7",@"8",@"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank {
    return [[PlayingCard rankStrings] count] - 1;
}

- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

-(void)setRank:(NSUInteger)rank {
    if (rank < [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (NSString *)suit {
    return _suit ? _suit : @"?";
    
}

@end
