//
//  CardMatchingGame.m
//  Machtimo
//
//  Created by Kishore Kumar on 03/02/13.
//  Copyright (c) 2013 Kishore Kumar. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property(nonatomic) NSUInteger cardsCount;
@property(strong, nonatomic) NSMutableArray *cards; //of card
@property(weak, nonatomic) Card* pivotCard;
@property(readwrite, nonatomic) int score;

- (void)updatePivotCard;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards{
    if (!_cards)
        _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)initWithCards:(NSUInteger)count :(Deck *)deck{
    self = [super init];
    
    if (self) {
        self.cardsCount = count;
        for (unsigned i=0; i<count; i++) {
            self.cards[i] = [deck drawRandomCard];
        }
    }
    
    return self;
}

- (int)calculateScore:(NSUInteger)matchCount{
    NSMutableArray *cardsToMatch = [[NSMutableArray alloc] init];
    for (Card *card in self.cards) {
        if (matchCount <= 0) {
            break;
        }
        if (card.isFaceUp && card != self.pivotCard) {
            [cardsToMatch addObject:card];
            matchCount -= 1;
        }
    }
    self.score = [self.pivotCard match:cardsToMatch];
    return self.score;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return self.cards[index];
}

- (void)flipCardAtIndex:(NSUInteger)index{
    [self updatePivotCard]; //Capture card that is already face up
    [[self.cards objectAtIndex:index] flip];
    [self updatePivotCard]; //do it again after a flip
}

- (void)updatePivotCard{
    for (Card *card in self.cards) {
        if (card.isFaceUp && card.isPlayable && !self.pivotCard){
            self.pivotCard = card;
            return;
        }
    }
    self.pivotCard = nil;
}


@end
