//
//  APIList.m
//

#import "APIList.h"

@implementation APIList

static APIList *apiListObj = nil;

// Get the shared instance and create it if necessary.
+ (APIList *)sharedAPIList {
    if (apiListObj == nil) {
        apiListObj = [[super allocWithZone:NULL] init];
    }
    return apiListObj;
}

- (id)init {
    if (self = [super init]) {
        // your custom initialization
    }
    return self;
}
#pragma mark Registration Call
- (void)API_sendLoginDetails: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock {
    [self callApiPostWithRequest:g_Request_Login Dictionary:dict showLoader:loader showOverlay:overlay completion:^(BOOL success, id responceData, NSMutableArray *arrShare) {
        completionBlock(success, responceData, arrShare);
    }];
}
- (void)API_sendFaceBookLoginDetails: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock {
    [self callApiPostWithRequest:g_Request_FBLogin Dictionary:dict showLoader:loader showOverlay:overlay completion:^(BOOL success, id responceData, NSMutableArray *arrShare) {
        completionBlock(success, responceData, arrShare);
    }];
}
- (void)API_sendSignUPDetails: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock {
    [self callApiPostWithRequest:g_Request_SignUP Dictionary:dict showLoader:loader showOverlay:overlay completion:^(BOOL success, id responceData, NSMutableArray *arrShare) {
        completionBlock(success, responceData, arrShare);
    }];
}

#pragma mark Utility Call
- (void)API_UnlockApp: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock {
    [self callApiPostWithRequest:g_Request_SignUP Dictionary:dict showLoader:loader showOverlay:overlay completion:^(BOOL success, id responceData, NSMutableArray *arrShare) {
        completionBlock(success, responceData, arrShare);
    }];
}
- (void)API_ForgotPassword: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock {
    [self callApiPostWithRequest:g_Request_ForgotPass Dictionary:dict showLoader:loader showOverlay:overlay completion:^(BOOL success, id responceData, NSMutableArray *arrShare) {
        completionBlock(success, responceData, arrShare);
    }];
}
- (void)API_ResetPassword: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock {
    [self callApiPostWithRequest:g_Request_ChangePassword Dictionary:dict showLoader:loader showOverlay:overlay completion:^(BOOL success, id responceData, NSMutableArray *arrShare) {
        completionBlock(success, responceData, arrShare);
    }];
}


#pragma DATA modification Call
- (void)API_EditDetails: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock {
    [self callApiPostWithRequest:g_Request_Edit_Details Dictionary:dict showLoader:loader showOverlay:overlay completion:^(BOOL success, id responceData, NSMutableArray *arrShare) {
        completionBlock(success, responceData, arrShare);
    }];
}
- (void)API_ImageUpload: (NSMutableDictionary *)dict image: (UIImage *)image ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock {
    [self callApiPostWithRequest:g_Request_Image_Upload image:image imageName:@"image" Dictionary:dict showLoader:loader showOverlay:overlay completion:^(BOOL success, id responceData, NSMutableArray *arrShare) {
        completionBlock(success, responceData, arrShare);
    }];
}







#pragma mark Other Call
- (void)API_ChangePassword: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock {
    [self callApiPostWithRequest:g_Request_ChangePassword Dictionary:dict showLoader:loader showOverlay:overlay completion:^(BOOL success, id responceData, NSMutableArray *arrShare) {
        completionBlock(success, responceData, arrShare);
    }];
}

- (void)API_sendEmailReport: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock {
    [self callApiPostWithRequest:g_Request_EmailReport Dictionary:dict showLoader:loader showOverlay:overlay completion:^(BOOL success, id responceData, NSMutableArray *arrShare) {
        completionBlock(success, responceData, arrShare);
    }];
}



- (void)API_DeleteExpenses: (NSInteger)Id  ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock {
    [self callApiPostWithRequest:g_StringFormate(@"%@%ld/", g_Request_delete_record, (long)Id)  Dictionary:nil showLoader:loader showOverlay:overlay completion:^(BOOL success, id responceData, NSMutableArray *arrShare) {
        completionBlock(success, responceData, arrShare);
    }];
}

- (void)APIAddRecord: (NSMutableDictionary *)dict image: (UIImage *)image ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock {
    [self callApiPostWithRequest:g_Request_Add_Record image:image imageName:@"image" Dictionary:dict showLoader:loader showOverlay:overlay completion:^(BOOL success, id responceData, NSMutableArray *arrShare) {
        completionBlock(success, responceData, arrShare);
    }];
}
- (void)API_InviteUser: (NSMutableDictionary *)dict ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock {
    [self callApiPostWithRequest:g_Request_invite_user Dictionary:dict showLoader:loader showOverlay:overlay completion:^(BOOL success, id responceData, NSMutableArray *arrShare) {
        completionBlock(success, responceData, arrShare);
    }];
}


// sync
- (void)API_SyncExpenses_RequestName: (NSString *)request parameter: (NSMutableDictionary *)dict image: (UIImage *)image imageName: (NSString *)imageName ShowLoader: (BOOL)loader showOverlay: (BOOL)overlay completion: (FetchAllRecord)completionBlock {
    
    [self callApiPostSyncWithRequest:request image:image imageName:imageName Dictionary:dict showLoader:loader showOverlay:overlay completion:^(BOOL success, id responceData, NSMutableArray *arrShare) {
        completionBlock(success, responceData, arrShare);
    }];
}

@end
