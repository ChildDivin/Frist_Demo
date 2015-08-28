//
//  LoadingView.h
//

#import <Foundation/Foundation.h>
#import "YXSpritesLoadingView.h"

@interface LoadingView : NSObject

+ (LoadingView *)sharedLoadingView;

+ (void)showLoader;
+ (void)showLoaderWithOverlay: (BOOL)overLay text: (NSString *)text;
+ (void)showLoaderWithOverlay: (BOOL)overLay;
+ (void)dismissLoader;

@end
