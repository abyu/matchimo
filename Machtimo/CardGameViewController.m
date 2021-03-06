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
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UISegmentedControl *matchModeSwitch;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
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
        [button setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        button.selected = card.isFaceUp;
        button.enabled = card.playable;
        button.alpha = button.isEnabled ? 1 : 0.3;
    }
    self.statusLabel.text = self.game.lastMatchDescription;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.matchModeSwitch.enabled = NO;
    self.matchModeSwitch.alpha = 0.3;
    [self updateUI];
    self.flipCount++;
}

- (IBAction)deal:(id)sender {
    [self.game reset:[[PlayingCardDeck alloc] init]];
    [self updateUI];
    self.matchModeSwitch.enabled = YES;
    self.matchModeSwitch.alpha = 1;
    self.flipCount = 0;
}

@end
