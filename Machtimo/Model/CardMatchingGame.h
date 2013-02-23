//
//  CardMatchingGame.h
//  Machtimo
//
//  Created by Kishore Kumar on 03/02/13.
//  Copyright (c) 2013 Kishore Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initializer
- (id) initWithCards:(NSUInteger)count :(Deck *)deck;
- (Card *)cardAtIndex:(NSUInteger)index;
- (void) flipCardAtIndex:(NSUInteger)index;
- (void) reset:(Deck *)deck;

@property(readonly, nonatomic)NSString *lastMatchDescription;
@property(readonly, nonatomic)int score;
@end
