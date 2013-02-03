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
@property(readwrite, nonatomic) int score;
- (void)calculateScore:(Card *)matchWithCard matchCount:(NSUInteger)matchCount;
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

- (void)calculateScore:(Card *)matchWithCard matchCount:(NSUInteger)matchCount{
    int score = 0;
    NSMutableArray *cardsToMatch = [[NSMutableArray alloc] init];
    for (Card *card in self.cards) {
        if (matchCount <= 0) {
            break;
        }
        if (card.isPlayable && card.isFaceUp && card != matchWithCard) {
            [cardsToMatch addObject:card];
            matchCount -= 1;
        }
    }
    score = [matchWithCard match:cardsToMatch];
    self.score += score;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return self.cards[index];
}

- (void)flipCardAtIndex:(NSUInteger)index{
    Card* card = [self.cards objectAtIndex:index];
    [card flip];
    [self calculateScore:card matchCount:1];
}

@end
