//
//  Singleton.h
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject {
    ShareUser *share;
}
@property (strong ,nonatomic) NSString *strToken;
@property (strong ,nonatomic) NSString *strFlagIMGSet;
@property (strong ,nonatomic) NSMutableArray *arrDATA;
@property (nonatomic) NSInteger intFlagType;

+ (Singleton *)sharedSingleton;
// user
- (void)setShareUser: (ShareUser *)shareObj;
- (ShareUser *)getShareUser;

-(void)setDeviceToken:(NSString *)Stoken;
-(NSString *)getDeviceToken;

-(void)setFlagIgnoreIMG:(NSString *)str;
-(NSString *)getFlagIgnoreIMG;

-(void)setArrDATA:(NSMutableArray *)arr;
-(NSMutableArray *)getarrDATA;

-(void)setIntFlagTypeMethod:(NSInteger)lagType;
-(NSInteger )getIntFlagTypeMethod;

- (NSMutableArray *)filterArray: (NSMutableArray *)arrShare categories: (NSDictionary *)dict;
- (UIImage *)getUIImageFromimage: (NSString *)imageName;
- (NSString *)getSignOfCurrency: (NSString *)currency;

@end
