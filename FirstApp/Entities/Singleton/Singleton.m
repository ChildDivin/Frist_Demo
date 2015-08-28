//
//  Singleton.m
//

#import "Singleton.h"

@implementation Singleton
@synthesize arrDATA,intFlagType,strToken,strFlagIMGSet;

static Singleton *singletonObj = nil;

// Get the shared instance and create it if necessary.
+ (Singleton *)sharedSingleton {
    if (singletonObj == nil) {
        singletonObj = [[super allocWithZone:NULL] init];
    }
    return singletonObj;
}
-(void)setDeviceToken:(NSString *)Stoken{
    strToken=Stoken;
}
-(NSString *)getDeviceToken{
    return strToken;
}
- (void)setShareUser: (ShareUser *)shareObj{
    share = shareObj;
}
- (ShareUser *)getShareUser{
    return share;
}
-(void)setFlagIgnoreIMG:(NSString *)str{
    strFlagIMGSet=str;
}
-(NSString *)getFlagIgnoreIMG{
    return strFlagIMGSet;
}





-(void)setArrDATA:(NSMutableArray *)arr{
    arrDATA=arr;
}
-(NSMutableArray *)getarrDATA{
    return arrDATA;
}

// flag for payment and type
-(void)setIntFlagTypeMethod:(NSInteger)lagType{
    intFlagType =lagType;
}
-(NSInteger )getIntFlagTypeMethod{
    return intFlagType;
}

#pragma mark -
#pragma mark Other
/*
- (NSMutableArray *)filterArray: (NSMutableArray *)arrShare categorys: (NSMutableArray *)arrCategory {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSMutableArray *arrTmpCategories = [[NSMutableArray alloc] init];
    for(NSString *str in arrCategory) {
        [arrTmpCategories addObject:[str lowercaseString]];
    }
    
    NSMutableArray *arrDates = [[NSMutableArray alloc] initWithArray:[DateHandler getDatesBetweenTwoDates]];
    
    for(ShareExpenses *shareObj in arrShare) {
        if(arrDates.count > 0) {
            if([arrDates containsObject:shareObj.strDate]) {
                if([arrTmpCategories containsObject:[shareObj.strType lowercaseString]] && [arrTmpCategories containsObject:[shareObj.strMethod lowercaseString]] && [arrTmpCategories containsObject:[shareObj.strCurrency lowercaseString]]) {
                    [arr addObject:shareObj];
                }
            }
        } else if([arrTmpCategories containsObject:[shareObj.strType lowercaseString]] && [arrTmpCategories containsObject:[shareObj.strMethod lowercaseString]] && [arrTmpCategories containsObject:[shareObj.strCurrency lowercaseString]]) {
            [arr addObject:shareObj];
        }
    }
    
    return arr;
}
 */

- (NSMutableArray *)filterArray: (NSMutableArray *)arrShare categories: (NSDictionary *)dict {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    NSMutableArray *arrType = [[NSMutableArray alloc] init];
    NSMutableArray *arrMethod = [[NSMutableArray alloc] init];
    NSMutableArray *arrCurrency = [[NSMutableArray alloc] init];
    
    for(NSString *str in (NSMutableArray *)[dict objectForKey:@"typesArray"]) {
        [arrType addObject:[str lowercaseString]];
    }
    
    for(NSString *str in (NSMutableArray *)[dict objectForKey:@"methodsArray"]) {
        [arrMethod addObject:[str lowercaseString]];
    }
    
    for(NSString *str in (NSMutableArray *)[dict objectForKey:@"currenciesArray"]) {
        [arrCurrency addObject:[str lowercaseString]];
    }
    
    NSMutableArray *arrDates = [[NSMutableArray alloc] initWithArray:[DateHandler getDatesBetweenTwoDates]];
    
    BOOL boolCheckCondition;
    
    for(ShareExpenses *shareObj in arrShare) {
        if(arrDates.count > 0) {
            if([arrDates containsObject:shareObj.strDate]) {
                boolCheckCondition = true;
            } else {
                boolCheckCondition = false;
            }
        } else {
            boolCheckCondition = true;
        }
        
        if(boolCheckCondition == true) {
            
            BOOL boolAddObject = false;
            
            if([arrType containsObject:@"all"] && [arrMethod containsObject:@"all"] && [arrCurrency containsObject:@"all"]) {
                boolAddObject = true;
            } else {
                if([arrType containsObject:@"all"] || [arrType containsObject:[shareObj.strType lowercaseString]]) {
                    boolAddObject = true;
                } else {
                    boolAddObject = false;
                }
                
                if(([arrMethod containsObject:@"all"] || [arrMethod containsObject:[shareObj.strMethod lowercaseString]]) && boolAddObject == true) {
                    boolAddObject = true;
                } else {
                    boolAddObject = false;
                }
                
                if(([arrCurrency containsObject:@"all"] || [arrCurrency containsObject:[shareObj.strCurrency lowercaseString]]) && boolAddObject == true) {
                    boolAddObject = true;
                } else {
                    boolAddObject = false;
                }
            }
            
            if(boolAddObject == true) {
                [arr addObject:shareObj];
            }
        }
    }
    
    return arr;
}

- (UIImage *)getUIImageFromimage: (NSString *)imageName {
    NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *imageFolder = [documentsPath stringByAppendingPathComponent:g_ImageFolderName];
    NSString *strFileName = g_StringFormate(@"%@_%@", [StaticClass retriveFromUserDefaults:g_UserDefaults_Token], imageName);
    NSString *strPath = [imageFolder stringByAppendingPathComponent:strFileName];
    return [UIImage imageWithContentsOfFile:strPath];
}

- (NSString *)getSignOfCurrency: (NSString *)currency {
    if([currency isEqualToString:LocalizedString(@"keyUSD", @"")]) {
        return LocalizedString(@"keyUSDSign", @"");
    } else if([currency isEqualToString:LocalizedString(@"keyEUR", @"")]) {
        return LocalizedString(@"keyEURSign", @"");
    } else if([currency isEqualToString:LocalizedString(@"keyGBP", @"")]) {
        return LocalizedString(@"keyGBPSign", @"");
    } else if([currency isEqualToString:LocalizedString(@"keyINR", @"")]) {
        return LocalizedString(@"keyINRSign", @"");
    } else if([currency isEqualToString:LocalizedString(@"keyAUD", @"")]) {
        return LocalizedString(@"keyAUDSign", @"");
    } else if([currency isEqualToString:LocalizedString(@"keyCAD", @"")]) {
        return LocalizedString(@"keyCADSign", @"");
    } else if([currency isEqualToString:LocalizedString(@"keySGD", @"")]) {
        return LocalizedString(@"keySGDSign", @"");
    } else if([currency isEqualToString:LocalizedString(@"keyCHF", @"")]) {
        return LocalizedString(@"keyCHFSign", @"");
    } else if([currency isEqualToString:LocalizedString(@"keyMYR", @"")]) {
        return LocalizedString(@"keyMYRSign", @"");
    } else if([currency isEqualToString:LocalizedString(@"keyJPY", @"")]) {
        return LocalizedString(@"keyJPYSign", @"");
    } else if([currency isEqualToString:LocalizedString(@"keyCNY", @"")]) {
        return LocalizedString(@"keyCNYSign", @"");
    } else
        return currency;
}

@end