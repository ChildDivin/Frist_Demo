//
//  DatabaseHandler.m
//

#import "DatabaseHandler.h"
#import "FMDatabase.h"

@implementation DatabaseHandler

static DatabaseHandler *databaseHandlerObj = NULL;
static NSString *strDatabasePath = nil;

// get the shared instance and create it if necessary.
+ (DatabaseHandler *)sharedDatabaseHandler {
    @synchronized(self) {
        if(databaseHandlerObj == NULL)
            databaseHandlerObj = [[self alloc] init];
    }
    return databaseHandlerObj;
}

#pragma mark -
#pragma mark Create Database If Not Exist
+ (void)createDatabase {
    // create database if not exist
    BOOL success;
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *DBPath = [pathArray objectAtIndex:0];
    
    strDatabasePath = [DBPath stringByAppendingPathComponent:k_DatabaseName];
    success = [filemanager fileExistsAtPath:strDatabasePath];
    if (!success) {
        NSString *defaultDBpath = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:k_DatabaseName];
        defaultDBpath = [defaultDBpath stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        success = [filemanager copyItemAtPath:defaultDBpath toPath:strDatabasePath error:&error];
        if (!success)
            [AlertView showAlert:LocalizedString(@"keyDatabaseFailedToCopy", @"") alertType:AJNotificationTypeRed];
    }
}

#pragma mark -
#pragma mark get Data From Table
+ (NSMutableArray *)getPaymentMethod {
    return [self getListFromTable:k_Table_PaymentMethod];
}
+ (NSMutableArray *)getPaymentMethodDefault {
    return [self getDefaultListFromTable:k_Table_PaymentMethod];
}
+ (NSMutableArray *)getPaymentMethodCustom {
    return [self getCustomListFromTable:k_Table_PaymentMethod];
}
#pragma -mark
+ (NSMutableArray *)getPeriodOfTime {
    return [self getListFromTable:k_Table_PeriodOfTime];
}
+ (NSMutableArray *)getPeriodOfTimeDefault {
    return [self getDefaultListFromTable:k_Table_PeriodOfTime];
}
+ (NSMutableArray *)getPeriodOfTimeCustom {
    return [self getCustomListFromTable:k_Table_PeriodOfTime];
}
#pragma -mark
+ (NSMutableArray *)getType {
    return [self getListFromTable:k_Table_Type];
}
+ (NSMutableArray *)getTypeDefault {
    return [self getDefaultListFromTable:k_Table_Type];
}
+ (NSMutableArray *)getTypeCustom {
    return [self getCustomListFromTable:k_Table_Type];
}

#pragma -mark
+ (NSMutableArray *)getCurrency {
    return [self getListFromTable:k_Table_Currency];
}

#pragma -mark
+ (NSMutableArray *)getListFromTable: (NSString *)tableName {
    NSMutableArray *arrShare = [[NSMutableArray alloc] init];
    
    FMDatabase *database = [FMDatabase databaseWithPath:strDatabasePath];
    if (![database open])
        return arrShare;
    
    FMResultSet *results = [database executeQuery:[NSString stringWithFormat:@"SELECT * From %@", tableName]];
    
    while ([results next]) {
        ShareList *shareObj = [[ShareList alloc] init];
        shareObj.intId = [[results stringForColumn:@"Id"] integerValue];
        shareObj.strTitle = (NSString *)[results stringForColumn:@"Value"];
        shareObj.strDefault = (NSString *)[results stringForColumn:@"is_Default"];
        [arrShare addObject:shareObj];
    }
    
    [database close];
    return arrShare;
}
+ (NSMutableArray *)getDefaultListFromTable: (NSString *)tableName {
    NSMutableArray *arrShare = [[NSMutableArray alloc] init];
    
    FMDatabase *database = [FMDatabase databaseWithPath:strDatabasePath];
    if (![database open])
        return arrShare;
    
    FMResultSet *results = [database executeQuery:[NSString stringWithFormat:@"SELECT * From %@ where is_Default = 1", tableName]];
    
    while ([results next]) {
        ShareList *shareObj = [[ShareList alloc] init];
        shareObj.intId = [[results stringForColumn:@"Id"] integerValue];
        shareObj.strTitle = (NSString *)[results stringForColumn:@"Value"];
        shareObj.strDefault = (NSString *)[results stringForColumn:@"is_Default"];
        [arrShare addObject:shareObj];
    }
    
    [database close];
    return arrShare;
}
+ (NSMutableArray *)getCustomListFromTable: (NSString *)tableName {
    NSMutableArray *arrShare = [[NSMutableArray alloc] init];
    
    FMDatabase *database = [FMDatabase databaseWithPath:strDatabasePath];
    if (![database open])
        return arrShare;
    
    FMResultSet *results = [database executeQuery:[NSString stringWithFormat:@"SELECT * From %@ where is_Default = 0", tableName]];
    
    while ([results next]) {
        ShareList *shareObj = [[ShareList alloc] init];
        shareObj.intId = [[results stringForColumn:@"Id"] integerValue];
        shareObj.strTitle = (NSString *)[results stringForColumn:@"Value"];
        shareObj.strDefault = (NSString *)[results stringForColumn:@"is_Default"];
        [arrShare addObject:shareObj];
    }
    
    [database close];
    return arrShare;
}
#pragma mark -
#pragma mark add Data to Table
+ (BOOL)addPaymentMethod: (NSString *)value {
    return [self addValueToTable:k_Table_PaymentMethod value:value];
}

+ (BOOL)addType: (NSString *)value {
    return [self addValueToTable:k_Table_Type value:value];
}

+ (BOOL)addValueToTable: (NSString *)tableName value: (NSString *)value {
    FMDatabase *database = [FMDatabase databaseWithPath:strDatabasePath];
    if (![database open])
        return false;
    
    NSString *strQuery =[NSString stringWithFormat:@"INSERT INTO %@ (Value, is_Default) VALUES (\"%@\", \"%d\")", tableName, value, 0];
    
    if([database executeUpdate:strQuery]) {
        [database close];
        return true;
    } else {
        [database close];
        [AlertView showAlert:LocalizedString(@"keyFailedToAdd", @"") hideAfterDelay:3.0 alertType:AJNotificationTypeRed];
        return false;
    }
}

#pragma mark -
#pragma mark delete Data from Table
+ (BOOL)deletePaymentMethod: (NSInteger)Id {
    return [self deleteValueToTable:k_Table_PaymentMethod Id:Id];
}

+ (BOOL)deleteType: (NSInteger)Id {
    return [self deleteValueToTable:k_Table_Type Id:Id];
}

+ (BOOL)deleteValueToTable: (NSString *)tableName Id: (NSInteger)Id {
    FMDatabase *database = [FMDatabase databaseWithPath:strDatabasePath];
    if (![database open])
        return false;
    
    NSString *strQuery = [NSString stringWithFormat:@"delete from %@ where Id = %ld",tableName, (long)Id];
    
    if([database executeUpdate:strQuery]) {
        [database close];
        return true;
    } else {
        [database close];
        [AlertView showAlert:LocalizedString(@"keyFailedToDelete", @"") hideAfterDelay:3.0 alertType:AJNotificationTypeRed];
        return false;
    }
}

#pragma mark -
#pragma mark edit Data to Table
+ (BOOL)editPaymentMethod_Value: (NSString *)value Id: (NSInteger)Id {
    return [self editValueToTable:k_Table_PaymentMethod value:value Id:Id];
}

+ (BOOL)editType_Value: (NSString *)value Id: (NSInteger)Id {
    return [self editValueToTable:k_Table_Type value:value Id:Id];
}

+ (BOOL)editValueToTable: (NSString *)tableName value: (NSString *)value Id: (NSInteger)Id {
    FMDatabase *database = [FMDatabase databaseWithPath:strDatabasePath];
    if (![database open])
        return false;
    
    NSString *strQuery = [NSString stringWithFormat:@"UPDATE %@ SET Value = '%@' WHERE Id = %ld",tableName, value, (long)Id];
    
    if([database executeUpdate:strQuery]) {
        [database close];
        return true;
    } else {
        [database close];
        [AlertView showAlert:LocalizedString(@"keyFailedToEdit", @"") hideAfterDelay:3.0 alertType:AJNotificationTypeRed];
        return false;
    }
}


@end
