//
//  PlayCardDeck.m
//  CardGame_v1
//
//  Created by MENG-YI HSU on 7/6/14.
//  Copyright (c) 2014 Marcus. All rights reserved.
//

#import "PlayCardDeck.h"
#import "PlayingCard.h"

@implementation PlayCardDeck

- (instancetype)init {
    self = [super init];
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 0; rank < [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
