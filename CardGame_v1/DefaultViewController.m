//
//  DefaultViewController.m
//  CardGame_v1
//
//  Created by MENG-YI HSU on 7/5/14.
//  Copyright (c) 2014 Marcus. All rights reserved.
//

#import "DefaultViewController.h"
#import "Deck.h"
#import "PlayCardDeck.h"
#import "CardMatchingGame.h"

@interface DefaultViewController ()

@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardsButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation DefaultViewController

- (CardMatchingGame *)game {
    if (!_game) {
        //NSLog(@"%d", [self.cardsButton count]);
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardsButton count] usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *)createDeck {
    return [[PlayCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    int chosenButtonIndex = [self.cardsButton indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self upadateUI];

}

- (void)upadateUI {
    for (UIButton *cardButton in self.cardsButton) {
        int cardButtonIndex = [self.cardsButton indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        NSLog(@"Match : %d", card.isMatched);
        cardButton.enabled = !card.isMatched;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score :  %d", self.game.score];
        //NSLog(@"%d", cardButtonIndex);
        //NSLog(@"Score :  %@", self.scoreLabel.text);
    }
}

- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"cardFront.jpeg" : @"cardBack.jpeg"];
}

- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : @"";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
