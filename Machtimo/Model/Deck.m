//
//  Deck.m
//  Machtimo
//
//  Created by Kishore Kumar on 31/01/13.
//  Copyright (c) 2013 Kishore Kumar. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property(strong, nonatomic) NSMutableArray *cards;
@end

@implementation Deck

- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    if(atTop)
        [self.cards insertObject:card atIndex: 0];
    else
        [self.cards addObject: card];
            
}

-(NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (Card *)drawRandomCard {
    Card* randomCard = nil;
    
    if(self.cards.count) {
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObject:randomCard];
    }
    
    return randomCard;
}

@end
