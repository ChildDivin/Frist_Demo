//
//  ParseShare.m
//  FirstApp
//
//  Created by Tops on 8/17/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "ParseShare.h"
#import<objc/runtime.h>

@implementation ParseShare

+(id)convertDictonary:(NSMutableDictionary *)dict :(NSString *)aKey{
    
    Class klass = NSClassFromString(aKey);
    
    if (klass) {
        
        // class exists
        id instance = [[klass alloc] init];
        uint count;
        objc_property_t* properties = class_copyPropertyList(klass, &count);
        NSMutableArray* propertyArray = [NSMutableArray arrayWithCapacity:count];
        for (int i = 0; i < count ; i++)
        {
            const char* propertyName = property_getName(properties[i]);
            [propertyArray addObject:[NSString  stringWithCString:propertyName encoding:NSUTF8StringEncoding]];
        }
        if ([dict isKindOfClass:[NSDictionary class]]){
            for( NSString *DataKey in [dict allKeys] )
            {
                if ([DataKey isEqualToString:@"id"]) {
                    
                    [instance setValue:[dict valueForKey:@"id"] forKey:[NSString stringWithFormat:@"%@_id",aKey]];
                    
                }else if([[dict valueForKey:DataKey] isKindOfClass:[NSArray class]]){
                    
                    id subinstance = [self convertArray:[dict valueForKey:DataKey] :[NSString stringWithFormat:@"%@Share",DataKey]];
                    
                    [instance setValue:subinstance forKey:[NSString stringWithFormat:@"ary%@",DataKey]];
                    
                }else{
                    if ([propertyArray containsObject:DataKey]) {
                        
                        [instance setValue:[dict valueForKey:DataKey] forKey:DataKey];
                    }
                }
            }
        }
        return instance;
    } else {
        // class doesn't exist
        return dict;
    }
    return nil;
}

+(NSMutableArray *)convertArray:(NSArray *)ary :(NSString *)aKey{
    NSMutableArray *returnArray = [[NSMutableArray alloc]init];
    for (NSMutableDictionary *dict in ary) {
        
        id instance = [self convertDictonary:dict :aKey];
        
        [returnArray addObject:instance];
    }
    return returnArray;
    
}
@end
