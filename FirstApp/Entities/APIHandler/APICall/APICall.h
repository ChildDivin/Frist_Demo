//
//  APICall.h
//

#import <Foundation/Foundation.h>

typedef void(^completionBlock) (BOOL success, id responceData, NSMutableArray *arrShare);

@interface APICall : NSObject

+ (APICall *)sharedAPICall;

- (void) callApiGetWithRequest: (NSString *)request showLoader: (BOOL)loader showOverlay: (BOOL)overlay completion :(completionBlock)completionBlock;
- (void) callApiPostWithRequest: (NSString *)request Dictionary: (NSMutableDictionary *)dict showLoader: (BOOL)loader showOverlay: (BOOL)overlay completion :(completionBlock)completionBlock;
- (void) callApiPostWithRequest: (NSString *)request image: (UIImage *)image imageName: (NSString *)imageName Dictionary: (NSMutableDictionary *)dict showLoader: (BOOL)loader showOverlay: (BOOL)overlay completion :(completionBlock)completionBlock;

// sync
- (void) callApiPostSyncWithRequest: (NSString *)request image: (UIImage *)image imageName: (NSString *)imageName Dictionary: (NSMutableDictionary *)dict showLoader: (BOOL)loader showOverlay: (BOOL)overlay completion :(completionBlock)completionBlock;

@end
