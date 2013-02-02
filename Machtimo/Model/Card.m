//
//  Card.m
//  Machtimo
//
//  Created by Kishore Kumar on 31/01/13.
//  Copyright (c) 2013 Kishore Kumar. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards{
    int score = 0;
    
    for (Card *aCard in otherCards) {
        if ([self.contents isEqualToString:aCard.contents] )
            score++;
    }
    
    return score;
}

@end
