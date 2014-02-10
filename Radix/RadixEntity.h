//
//  RadixEntity.h
//  Radix
//
//  Created by Alexey Storozhev on 10.02.14.
//  Copyright (c) 2014 Константин Фомин. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSUInteger RadixBase;

enum
{
    RadixBaseBinary = 2,
    RadixBaseOctal = 8,
    RadixBaseDecimal = 10,
    RadixBaseHex = 16
};

@interface RadixEntity : NSObject

@property (nonatomic, assign, readonly) RadixBase base;
@property (nonatomic, copy, readonly) NSString *title;

- (instancetype)initWithBase:(RadixBase)base;
+ (instancetype)entityWithBase:(RadixBase)base;

- (instancetype)initWithBase:(RadixBase)base title:(NSString *)title;
+ (instancetype)entityWithBase:(RadixBase)base title:(NSString *)title;

@end
