//
//  ShareExpenses.m
//  VanCoile
//
//  Created by Tops on 7/14/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import "ShareExpenses.h"

@implementation ShareExpenses

@synthesize intId;
@synthesize boolIsLocalExpense;
@synthesize strType, strDescription, strPrice, strDate, strCurrency, strImage, strMethod, strExpenseType;

-(id)init {
    ShareExpenses *share = [super init];
    return share;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    // field name : json name
    return @{
             @"strType"         : @"type",
             @"strDescription"  : @"comments",
             @"strPrice"        : @"amount",
             @"strDate"         : @"date",
             @"intId"           : @"id",
             @"strCurrency"     : @"currency",
             @"strImage"        : @"image",
             @"strMethod"       : @"method",
             };
}

@end
