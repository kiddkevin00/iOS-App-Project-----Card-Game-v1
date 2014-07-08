//
//  Card.m
//  CardGame_v1
//
//  Created by MENG-YI HSU on 7/5/14.
//  Copyright (c) 2014 Marcus. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (NSInteger)match:(NSArray *)otherCards {
    int score = 0;
    for (Card *card in otherCards) {
        [card.contents isEqualToString:self.contents];
        score++;
    }
    return score;
}

@end
