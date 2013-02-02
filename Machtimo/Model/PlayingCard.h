//
//  PlayingCard.h
//  Machtimo
//
//  Created by Kishore Kumar on 31/01/13.
//  Copyright (c) 2013 Kishore Kumar. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property(strong, nonatomic) NSString *suit;

@property(nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (int)maxRank;

@end
