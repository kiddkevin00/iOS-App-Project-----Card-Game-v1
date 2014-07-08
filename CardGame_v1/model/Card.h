//
//  Card.h
//  CardGame_v1
//
//  Created by MENG-YI HSU on 7/5/14.
//  Copyright (c) 2014 Marcus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isMatched) BOOL matched;
@property (nonatomic, getter = isChosen) BOOL chosen;

- (NSInteger)match:(NSArray *)otherCards;



@end
