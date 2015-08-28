//
//  AlertView.m
//

#import "AlertView.h"

@implementation AlertView

static AlertView *alertViewObj = nil;

// Get the shared instance and create it if necessary.
+ (AlertView *)sharedAlertView {
    if (alertViewObj == nil) {
        alertViewObj = [[super allocWithZone:NULL] init];
    }
    return alertViewObj;
}

- (id)init {
    if (self = [super init]) {
        // your custom initialization
    }
    return self;
}

+ (void)showSystemAlert: (NSString *)strMessage {
    [self showSystemAlert:strMessage hideAfterDelay:2.0];
}

+ (void)showSystemAlert: (NSString *)strMessage hideAfterDelay: (NSTimeInterval)delayTime {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:LocalizedString(@"keyAppName", @"") message:strMessage delegate:nil cancelButtonTitle:LocalizedString(@"keyOk", @"") otherButtonTitles:nil];
    [alert show];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayTime * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [alert dismissWithClickedButtonIndex:0 animated:true];
    });
}

+ (void)showAlert: (NSString *)strMessage alertType: (AJNotificationType)type {
    [self showAlert:strMessage hideAfterDelay:3.0 alertType:type];
}

+ (void)showAlert: (NSString *)strMessage hideAfterDelay: (NSTimeInterval)delayTime alertType: (AJNotificationType)type {
    [AJNotificationView hideCurrentNotificationViewAndClearQueue];
    [AJNotificationView showNoticeInView:g_AppDelegate.window type:type title:strMessage linedBackground:AJLinedBackgroundTypeDisabled hideAfter:delayTime];
}

+ (void)showAlertWithoutButton: (NSString *)strMessage hideAfterDelay: (NSTimeInterval)delayTime {
}

+ (void)showAlert: (NSString *)strMessage cancelButton: (NSString *)cancelTitle otherButtons: (NSArray *)otherTitles clickedIndex: (clickedOnButton)index {
}

- (void)showAlert :(NSString *)strMessage :(int)tag {
    UIAlertView *alertObj = [[UIAlertView alloc] initWithTitle:LocalizedString(@"keyAppName", @"") message:strMessage delegate:self cancelButtonTitle:LocalizedString(@"keyNo", @"") otherButtonTitles:LocalizedString(@"keyYes", @""), nil];
    alertObj.tag = tag;
    [alertObj show];
}

#pragma mark -
#pragma mark – UIAlertView Delegate Method
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 1) {
        [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%ld",(long)alertView.tag] object:nil];
    }
}

@end
