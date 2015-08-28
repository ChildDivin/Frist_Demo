//
//  APIList.h
//

#import <Foundation/Foundation.h>
#import "APICall.h"
#import <UIKit/UIKit.h>

typedef void(^FetchAllRecord) (BOOL success, id responceData, NSMutableArray *share);

@interface APIList : APICall

+ (APIList *)sharedAPIList;

- (void)API_UnlockApp: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock;
#pragma mark Registration Call
- (void)API_sendLoginDetails: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock;  //simple login
- (void)API_sendFaceBookLoginDetails: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock;  //LoginWithFacebook
- (void)API_sendSignUPDetails: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock; //Simple sign up
#pragma  mark Utility Call
- (void)API_ForgotPassword: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock; //Forgot Password
#pragma  mark DATA modification Call
- (void)API_EditDetails: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock; //Edit record
- (void)API_ImageUpload: (NSMutableDictionary *)dict image: (UIImage *)image ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock; //Image upload
- (void)API_ResetPassword: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock; //Change password
@end
