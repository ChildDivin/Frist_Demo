//
//  ShareExpenses.h
//  VanCoile
//
//  Created by Tops on 7/14/15.
//  Copyright (c) 2015 tops. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareExpenses : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign) NSInteger intId;
@property (nonatomic, strong) NSString *strCurrency;
@property (nonatomic, strong) NSString *strImage;
@property (nonatomic, strong) NSString *strMethod;
@property (nonatomic, strong) NSString *strType;
@property (nonatomic, strong) NSString *strDescription;
@property (nonatomic, strong) NSString *strPrice;
@property (nonatomic, strong) NSString *strDate;
@property (nonatomic, strong) NSString *strExpenseType;

@property (nonatomic) BOOL boolIsLocalExpense;

+ (NSDictionary *)JSONKeyPathsByPropertyKey;

@end
