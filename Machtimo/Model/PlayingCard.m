//
//  PlayingCard.m
//  Machtimo
//
//  Created by Kishore Kumar on 31/01/13.
//  Copyright (c) 2013 Kishore Kumar. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

+ (NSArray *)validRanks {
    return @[@"?", @"A", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSArray *)validSuits {
    return @[@"♥", @"♦", @"♠", @"♣"];
}

+ (int) maxRank {
    return [[self validRanks] count];
}

- (NSString *)contents {
    return [[PlayingCard validRanks][self.rank] stringByAppendingString: self.suit];
}

- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject: suit])
        _suit = suit;
}

- (void)setRank:(NSUInteger)rank {
    if (rank < [PlayingCard maxRank])
        _rank = rank;
}

- (NSString *)suit {
    return _suit ? _suit : @"?";
}

@end
