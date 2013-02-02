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

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) PlayingCardDeck *deck;
@end

@implementation CardGameViewController



- (void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender {
    Card *card = [self.deck drawRandomCard];
    [sender setTitle: card.contents forState: UIControlStateSelected];
    sender.selected = !sender.selected;
    self.flipCount++;
}

- (PlayingCardDeck *)deck {
    if (!_deck)
        _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

@end
