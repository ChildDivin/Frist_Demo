//
//  AlertView.h
//

#import <Foundation/Foundation.h>
#import "AJNotificationView.h"

typedef void(^clickedOnButton) (NSInteger clickedIndex);

@interface AlertView : NSObject

+ (AlertView *)sharedAlertView;

+ (void)showSystemAlert: (NSString *)strMessage;
+ (void)showSystemAlert: (NSString *)strMessage hideAfterDelay: (NSTimeInterval)delayTime;
+ (void)showAlert: (NSString *)strMessage alertType: (AJNotificationType)type;
+ (void)showAlert: (NSString *)strMessage hideAfterDelay: (NSTimeInterval)delayTime alertType: (AJNotificationType)type;
+ (void)showAlertWithoutButton :(NSString *)strMessage hideAfterDelay :(NSTimeInterval)delayTime;
+ (void)showAlert: (NSString *)strMessage cancelButton: (NSString *)cancelTitle otherButtons: (NSArray *)otherTitles clickedIndex: (clickedOnButton)index;
- (void)showAlert :(NSString *)strMessage :(int)tag;

@end
