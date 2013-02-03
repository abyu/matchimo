//
//  CardGameViewController.m
//  Machtimo
//
//  Created by Kishore Kumar on 30/01/13.
//  Copyright (c) 2013 Kishore Kumar. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game {
    if (!_game)
        _game = [[CardMatchingGame alloc] initWithCards:16 :[[PlayingCardDeck alloc] init]];
    return _game;
}

- (void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (void) setCardButtons:(NSArray *)cardButtons {
    _cardButtons = cardButtons;
    [self updateUI];
}

- (void) updateUI {
    for (UIButton *button in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:button]];
        [button setTitle:card.contents forState:UIControlStateSelected];
        button.selected = card.isFaceUp;
    }
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self.game calculateScore:1];
    [self updateUI];
    self.flipCount++;
}


@end
