//
//  StaticClass.h
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "QSStrings.h"
#import "Reachability.h"
#import <CoreText/CoreText.h>

@interface StaticClass : NSObject

+ (NSString *)urlEncoding: (NSString *)raw;
+ (NSString *)urlDecode: (NSString *)raw;

+ (NSString *)returnMD5Hash: (NSString *)concat;
+ (NSString *)encodeBase64WithString: (NSString *)strData;
+ (NSString *)encodeBase64WithData: (NSData *)objData;

+ (NSString *)setEncodeString: (NSString *)string;

+ (void)saveBoolToUserDefaults:(bool)value key:(NSString *)pref;
+ (bool)retriveBoolFromUserDefaults :(NSString *)pref;

+ (void)saveIntegerToUserDefaults:(NSInteger)value key:(NSString *)pref;
+ (NSInteger)retriveIntegerFromUserDefaults :(NSString *)pref;

+ (void)saveToUserDefaults: (id)data key: (NSString *)pref;
+ (id)retriveFromUserDefaults: (NSString *)pref;

+ (UIImage *)resizeImage: (UIImage *)image;

+ (BOOL)isconnectedToNetwork;
+ (BOOL)isconnectedToNetwork: (BOOL)showAlert;
+(BOOL) NSStringIsValidEmail:(NSString *)checkString;
+ (NSString *)removeNull: (NSString *)str;
+ (NSString *)removeBlankSpace: (NSString *)str;
+ (NSString *)setHttpsPrefixToWebsite: (NSString *)website;
+ (CGSize)getSizeOfString: (NSString *)message width: (float)width font: (UIFont *)font minimumHeight: (CGFloat)minHeight;
+ (NSArray *)getArrayOfLinesForMessage: (NSString *)message font: (UIFont *)font rect: (CGRect)rect;
+(id)AddNibWithnibName:(NSString *)strNib;
+(void)ShowHelpViewWithMessage:(NSString *)str :(BOOL)animation;
@end
