//
//  DateHandler.m
//

#import "DateHandler.h"

@implementation DateHandler

static DateHandler *dateHandlerObj = NULL;

// Get the shared instance and create it if necessary.
+ (DateHandler *)sharedDateHandler {
    @synchronized(self) {
        if(dateHandlerObj == NULL)
            dateHandlerObj = [[self alloc] init];
    }
    return dateHandlerObj;
}

+ (NSString *)convertDateToString: (NSDate *)date formate:(NSString *)formate {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:formate];
    return [dateFormat stringFromDate:date];
}

+ (NSDate *)convertStringToDate: (NSString *)date formate:(NSString *)formate {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:formate];
    return [dateFormat dateFromString:date];
}

+ (NSDate *)removeTimeFromDate: (NSDate *)date {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

+ (NSDate *)getLastDateOfMonthFromCurrentMont: (NSInteger)month {
    NSDate *curDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* comps = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:curDate]; // Get necessary date components
    
    // set last of month
    [comps setMonth:[comps month]+(month)];
    [comps setDay:0];
    return [calendar dateFromComponents:comps];
}

+ (NSMutableArray *)getDatesBetweenTwoDates {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:(NSMutableDictionary *)[StaticClass retriveFromUserDefaults:g_UserDefaults_DictExpensesSorting]];
    
    NSDate *startDate = [dict valueForKey:g_Dict_SelectedFromDate];
    NSDate *endDate = [dict valueForKey:g_Dict_SelectedToDate];
    
    NSMutableArray *arrDates = [[NSMutableArray alloc] init];
    if(startDate == nil || endDate == nil)
        return arrDates;
    
    [arrDates addObject:[DateHandler convertDateToString:startDate formate:k_DateFormate_EmailReport]];
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorianCalendar components:NSDayCalendarUnit
                                                        fromDate:startDate
                                                          toDate:endDate
                                                         options:0];
    
    for (NSInteger i=1; i<components.day; ++i) {
        NSDateComponents *newComponents = [NSDateComponents new];
        newComponents.day = i;

        NSDate *date = [gregorianCalendar dateByAddingComponents:newComponents toDate:startDate options:0];
        if(![arrDates containsObject:[DateHandler convertDateToString:date formate:k_DateFormate_EmailReport]])
            [arrDates addObject:[DateHandler convertDateToString:date formate:k_DateFormate_EmailReport]];
    }
    
    if(![arrDates containsObject:[DateHandler convertDateToString:endDate formate:k_DateFormate_EmailReport]])
        [arrDates addObject:[DateHandler convertDateToString:endDate formate:k_DateFormate_EmailReport]];
    
    return arrDates;
}

@end
