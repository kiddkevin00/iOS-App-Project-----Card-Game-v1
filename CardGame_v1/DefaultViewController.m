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

@interface DefaultViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic) NSUInteger flipCount;
@property (strong, nonatomic) Deck *deck;

@end

@implementation DefaultViewController

- (Deck *)deck {
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}

- (Deck *)createDeck {
    return [[PlayCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardBack.jpeg"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        Card *card = [self.deck drawRandomCard];
        [sender setBackgroundImage:[UIImage imageNamed:@"cardBack.jpeg"] forState:UIControlStateNormal];
        [sender setTitle:card.contents forState:UIControlStateNormal];
        NSLog(@"content : %@", card.contents);
    }
    self.flipCount++;
}

- (void)setFlipCount:(NSUInteger)flipCount {
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Flip: %d", self.flipCount];
    NSLog(@"flip count : %d", self.flipCount);
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
