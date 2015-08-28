//
//  DateHandler.h
//

#import <Foundation/Foundation.h>

#define k_DateFormate_EmailReport @"yyyy-MM-dd"
#define k_DateFormate_Expenses @"dd/MM/yyyy"

@interface DateHandler : NSObject

+ (DateHandler *)sharedDateHandler;

+ (NSString *)convertDateToString: (NSDate *)date formate:(NSString *)formate;
+ (NSDate *)convertStringToDate: (NSString *)date formate:(NSString *)formate;
+ (NSDate *)removeTimeFromDate: (NSDate *)date;
+ (NSDate *)getLastDateOfMonthFromCurrentMont: (NSInteger)month;
+ (NSMutableArray *)getDatesBetweenTwoDates;

@end
