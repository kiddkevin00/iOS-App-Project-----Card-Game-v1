//
//  CardMatchingGame.m
//  CardGame_v1
//
//  Created by MENG-YI HSU on 7/6/14.
//  Copyright (c) 2014 Marcus. All rights reserved.
//

#import "CardMatchingGame.h"
#import "PlayingCard.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // Card
@property (nonatomic, readwrite) NSString *interactiveText;

@end

@implementation CardMatchingGame

- (void) resetScore {
    self.score = 0;
}

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    if (self) {
        for (int i=0; i<count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return index<[self.cards count] ? self.cards[index] : nil;
}

static const int MATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index {
    //NSLog(@"%d  %d", index, [self.cards count]);
    Card *card = [self.cards objectAtIndex:index];
    self.interactiveText = [NSString stringWithFormat:@"Please Continue.."];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        self.interactiveText = [NSString stringWithFormat:@"Congradulation!!"];
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MATCH_PENALTY;
                        self.interactiveText = [NSString stringWithFormat:@"Sorry! Please try agin.."];
                        // flip the other mismatched card
                        otherCard.chosen = NO;
                    }
                    break; // can only support 2 card
                    
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.Chosen = YES;
        }
        
    }
}

@end
