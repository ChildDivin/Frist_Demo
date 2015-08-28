
//  APICall.m
//

#import "APICall.h"

@implementation APICall

static APICall *apiCallObj = nil;

// Get the shared instance and create it if necessary.
+ (APICall *)sharedAPICall {
    if (apiCallObj == nil) {
        apiCallObj = [[super allocWithZone:NULL] init];
    }
    return apiCallObj;
}

- (id)init {
    if (self = [super init]) {
        // your custom initialization
    }
    return self;
}

- (void) callApiGetWithRequest: (NSString *)request showLoader: (BOOL)loader showOverlay: (BOOL)overlay completion :(completionBlock)completionBlock {
    if(![StaticClass isconnectedToNetwork])
        return;

    if(loader)
        [LoadingView showLoaderWithOverlay:overlay];
    
//    NSLog(@"API_GET : %@\n Authorization: Token %@",g_StringFormate(@"%@%@", g_APIBaseURL, request), [StaticClass retriveFromUserDefaults:g_UserDefaults_Token]);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    manager.responseSerializer.acceptableStatusCodes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 400)];
    
//    if(![request isEqualToString:g_Request_Login] && ![request isEqualToString:g_Request_ForgotPass]) {
//        [manager.requestSerializer setValue:g_StringFormate(@"Token %@", [StaticClass retriveFromUserDefaults:g_UserDefaults_Token]) forHTTPHeaderField:@"Authorization"];
//    }
    
    [manager GET:g_StringFormate(@"%@%@", g_APIBaseURL, request) parameters:nil success:^(AFHTTPRequestOperation *operation, id responceObject){
        if(loader)
            [LoadingView dismissLoader];
        
        if([responceObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dictResponce = (NSDictionary *)responceObject;
            if([[dictResponce valueForKey:@"FLAG"] boolValue]) {
                completionBlock(true, responceObject, [self fillDataForRequest:request array:nil]);
            } else {
                [AlertView showAlert:[dictResponce valueForKey:@"MESSAGE"] alertType:AJNotificationTypeRed];
            }
        } else
            completionBlock(true, responceObject, [self fillDataForRequest:request array:nil]);
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error){
        if(loader) {
            [LoadingView dismissLoader];
        }
        [AlertView showAlert:[error localizedDescription] alertType:AJNotificationTypeRed];
    }];
}

- (void) callApiPostWithRequest: (NSString *)request Dictionary: (NSMutableDictionary *)dict showLoader: (BOOL)loader showOverlay: (BOOL)overlay completion :(completionBlock)completionBlock {
    if(![StaticClass isconnectedToNetwork])
        return;
    
    if(loader)
        [LoadingView showLoaderWithOverlay:overlay];
    
    NSLog(@"API_POST : :%@: \n\tParameters : %@",g_StringFormate(@"%@%@", g_APIBaseURL, request), dict);
    
    NSString *encoded = [g_StringFormate(@"%@%@", g_APIBaseURL, request) stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    manager.responseSerializer.acceptableStatusCodes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 400)];
    
//    if(![request isEqualToString:g_Request_Login] && ![request isEqualToString:g_Request_ForgotPass]) {
//        [manager.requestSerializer setValue:g_StringFormate(@"Token %@", [StaticClass retriveFromUserDefaults:g_UserDefaults_Token]) forHTTPHeaderField:@"Authorization"];
//    }

    [manager POST:encoded parameters:dict success:^(AFHTTPRequestOperation *operation, id responceObject) {
        if(loader)
            [LoadingView dismissLoader];
        
        NSDictionary *dictResponce = (NSDictionary *)responceObject;
        
        if([[dictResponce valueForKey:@"FLAG"] boolValue]) {
            completionBlock(true, responceObject, [self fillDataForRequest:request array:nil]);
        } else {
            [AlertView showAlert:[dictResponce valueForKey:@"MESSAGE"] alertType:AJNotificationTypeRed];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(loader)
            [LoadingView dismissLoader];

        [AlertView showAlert:[error localizedDescription] alertType:AJNotificationTypeRed];
    }];
}

//- (void) callApiPostWithRequest: (NSString *)request image: (UIImage *)image imageName: (NSString *)imageName Dictionary: (NSMutableDictionary *)dict showLoader: (BOOL)loader showOverlay: (BOOL)overlay completion :(completionBlock)completionBlock {
//    if(![StaticClass isconnectedToNetwork])
//        return;
//
//    if(loader)
//        [LoadingView showLoaderWithOverlay:overlay];
//    
//    NSLog(@"API_POST_Image : %@ \n\tImage_Name : %@ \n\tParameters : %@ ",g_StringFormate(@"%@%@", g_APIBaseURL, request), imageName, dict);
//    
//    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:g_StringFormate(@"%@%@", g_APIBaseURL, request)]];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    manager.responseSerializer.acceptableStatusCodes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 400)];
//    
//    AFHTTPRequestOperation *op = [manager POST:g_StringFormate(@"%@%@", g_APIBaseURL, request) parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        if(image) {
//            NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
//            [formData appendPartWithFileData:imageData name:imageName fileName:@"photo.jpg" mimeType:@"image/jpeg"];
//        }
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if(loader) {
//            [LoadingView dismissLoader];
//        }
//        
//        NSDictionary *dictResponce = (NSDictionary *)responseObject;
//        
//        if([[dictResponce valueForKey:@"FLAG"] boolValue]) {
//            completionBlock(true, responseObject, [self fillDataForRequest:request array:nil]);
//        } else {
//
//            [AlertView showAlert:[dictResponce valueForKey:@"MESSAGE"] alertType:AJNotificationTypeRed];
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if(loader) {
//            [LoadingView dismissLoader];
//        }
//        [AlertView showAlert:[error localizedDescription] alertType:AJNotificationTypeRed];
//    }];
//    [op start];
//}

- (void) callApiPostWithRequest: (NSString *)request image: (UIImage *)image imageName: (NSString *)imageName Dictionary: (NSMutableDictionary *)dict showLoader: (BOOL)loader showOverlay: (BOOL)overlay completion :(completionBlock)completionBlock {
    if(![StaticClass isconnectedToNetwork])
        return;
    
    if(loader)
        [LoadingView showLoaderWithOverlay:overlay];
    
    NSLog(@"API_POST_Image : %@ \n\tImage_Name : %@ \n\tParameters : %@ ",g_StringFormate(@"%@%@", g_APIBaseURL, request), imageName, dict);
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:g_StringFormate(@"%@%@", g_APIBaseURL, request)]];
    //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    manager.responseSerializer.acceptableStatusCodes = [NSIndexSet indexSetWithIndex:200];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
   
    
    AFHTTPRequestOperation *op = [manager POST:g_StringFormate(@"%@%@", g_APIBaseURL, request) parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        if(image) {
            NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
            [formData appendPartWithFileData:imageData name:@"image" fileName:@"photo.jpg" mimeType:@"image/jpeg"];
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(loader) {
            [LoadingView dismissLoader];
        }
        
        NSArray *arrResponce = (NSArray *)responseObject;
        completionBlock(true, responseObject, [self fillDataForRequest:request array:arrResponce]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(loader) {
            [LoadingView dismissLoader];
        }
        [AlertView showAlert:[error localizedDescription] alertType:AJNotificationTypeRed];
    }];
    [op start];
}

- (NSMutableArray *)fillDataForRequest: (NSString *)request array :(NSArray *)arrResponce {
    NSMutableArray *arrShare = [[NSMutableArray alloc] init];
    return arrShare;
}


//sync
- (void) callApiPostSyncWithRequest: (NSString *)request image: (UIImage *)image imageName: (NSString *)imageName Dictionary: (NSMutableDictionary *)dict showLoader: (BOOL)loader showOverlay: (BOOL)overlay completion :(completionBlock)completionBlock {
    if(![StaticClass isconnectedToNetwork]) {
        completionBlock(false, nil, nil);
        return;
    }
    
    if(loader)
        [LoadingView showLoaderWithOverlay:overlay];
    
    NSLog(@"API_POST_Image : %@ \n\tImage_Name : %@ \n\tParameters : %@ ",g_StringFormate(@"%@%@", g_APIBaseURL, request), imageName, dict);
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:g_StringFormate(@"%@%@", g_APIBaseURL, request)]];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    manager.responseSerializer.acceptableStatusCodes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 400)];
    
//    if(![request isEqualToString:g_Request_Login] && ![request isEqualToString:g_Request_ForgotPass]) {
//        [manager.requestSerializer setValue:g_StringFormate(@"Token %@", [StaticClass retriveFromUserDefaults:g_UserDefaults_Token]) forHTTPHeaderField:@"Authorization"];
//    }
    
    AFHTTPRequestOperation *op = [manager POST:g_StringFormate(@"%@%@", g_APIBaseURL, request) parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        if(image) {
            NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
            [formData appendPartWithFileData:imageData name:imageName fileName:@"photo.jpg" mimeType:@"image/jpeg"];
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(loader) {
            [LoadingView dismissLoader];
        }
        
        NSDictionary *dictResponce = (NSDictionary *)responseObject;
        
        if([dictResponce valueForKey:@"FLAG"]) {
            completionBlock(true, responseObject, nil);
        } else {
            completionBlock(false, responseObject, nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if(loader) {
            [LoadingView dismissLoader];
        }
        completionBlock(false, nil, nil);
    }];
    [op start];
}

@end
