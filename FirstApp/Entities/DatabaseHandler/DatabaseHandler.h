//
//  DatabaseHandler.h
//

#import <Foundation/Foundation.h>

#define k_DatabaseName  @"VanCoile.sqlite"

#define k_Table_PaymentMethod  @"PaymentMethod"
#define k_Table_PeriodOfTime  @"PeriodOfTime"
#define k_Table_Type  @"Type"
#define k_Table_Currency  @"Currency"

#define k_Table_DeletedExpensesList @"tblDeletedExpensesList"
#define k_Table_NewExpenses         @"tblNewExpenses"
#define k_Table_EditedExpenses      @"tblEditedExpenses"

@interface DatabaseHandler : NSObject

+ (DatabaseHandler *)sharedDatabaseHandler;

+ (void)createDatabase;

+ (NSMutableArray *)getPaymentMethod;
+ (NSMutableArray *)getPaymentMethodDefault;
+ (NSMutableArray *)getPaymentMethodCustom;
+ (NSMutableArray *)getPeriodOfTime;
+ (NSMutableArray *)getPeriodOfTimeDefault;
+ (NSMutableArray *)getPeriodOfTimeCustom;
+ (NSMutableArray *)getType;
+ (NSMutableArray *)getTypeDefault;
+ (NSMutableArray *)getTypeCustom;

+ (NSMutableArray *)getCurrency;

+ (BOOL)addPaymentMethod: (NSString *)value;
+ (BOOL)addType: (NSString *)value;

+ (BOOL)deletePaymentMethod: (NSInteger)Id;
+ (BOOL)deleteType: (NSInteger)Id;

+ (BOOL)editPaymentMethod_Value: (NSString *)value Id: (NSInteger)Id;
+ (BOOL)editType_Value: (NSString *)value Id: (NSInteger)Id;

+ (BOOL)isExpenseExistInNewTable: (NSInteger)Id;
+ (BOOL)isExpenseExistInEditedTable: (NSInteger)Id;

// sync
+ (BOOL)addDeletedExpense: (NSInteger)Id;
+ (NSMutableArray *)getDeletedExpenses;
+ (BOOL)removeDeletedExpense: (NSInteger)Id;

+ (BOOL)addNewExpense: (NSDictionary *)dict image: (UIImage *)image;
+ (NSMutableArray *)getNewExpenses;
+ (BOOL)removeNewExpense: (NSInteger)Id;

+ (NSString *)editExpense: (NSDictionary *)dict image: (UIImage *)image shareObject: (ShareExpenses *)shareObj;
+ (NSMutableArray *)getEditedExpenses;
+ (BOOL)removeEditedExpense: (NSInteger)Id;

@end

/*      PaymentMethod   :-- Id, Value, is_Default
        PeriodOfTime    :-- Id, Value, is_Default
        Type            :-- Id, Value, is_Default
        Currency        :-- Id, Value, is_Default
 
        tblDeletedExpensesList  :-- id, token, isLocalExpense(bool value)
        tblNewExpenses      :-- id, image, amount, currency, method, type, date, comments, token, isLocalExpense
        tblEditedExpenses   :-- id, image, amount, currency, method, type, date, comments, token, isLocalExpense
 */
