//
//  RadixEntity.m
//  Radix
//
//  Created by Alexey Storozhev on 10.02.14.
//  Copyright (c) 2014 Константин Фомин. All rights reserved.
//

#import "RadixEntity.h"

@interface RadixEntity()

@property (nonatomic, assign) RadixBase base;
@property (nonatomic, copy) NSString *title;

@end

@implementation RadixEntity

- (instancetype)initWithBase:(RadixBase)base
{
    return [self initWithBase:base title:[NSString stringWithFormat:@"base %u", base]];
}

+ (instancetype)entityWithBase:(RadixBase)base
{
    return [[self alloc] initWithBase:base];
}

- (instancetype)initWithBase:(RadixBase)base title:(NSString *)title
{
    self = [super init];
    if (self) {
        _base = base;
        _title = title;
    }
    return self;
}

+ (instancetype)entityWithBase:(RadixBase)base title:(NSString *)title
{
    return [[self alloc] initWithBase:base title:title];
}

@end
