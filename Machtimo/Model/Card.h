//
//  Card.h
//  Machtimo
//
//  Created by Kishore Kumar on 31/01/13.
//  Copyright (c) 2013 Kishore Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(strong, nonatomic) NSString *contents;

@property(nonatomic, getter = isFaceUp) BOOL faceUp;
@property(nonatomic, getter = isUnPlayable) BOOL unPlayable;

- (int) match:(NSArray *) otherCards;

@end
