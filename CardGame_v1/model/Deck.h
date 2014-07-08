//
//  Deck.h
//  CardGame_v1
//
//  Created by MENG-YI HSU on 7/5/14.
//  Copyright (c) 2014 Marcus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
