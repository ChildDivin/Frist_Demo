//
//  LoadingView.m
//

#import "LoadingView.h"

@implementation LoadingView

static LoadingView *loadingViewObj = nil;

// Get the shared instance and create it if necessary.
+ (LoadingView *)sharedLoadingView {
    if (loadingViewObj == nil) {
        loadingViewObj = [[super allocWithZone:NULL] init];
    }
    return loadingViewObj;
}

- (id)init {
    if (self = [super init]) {
        // your custom initialization
    }
    return self;
}

+ (void)showLoader {
    [self showLoaderWithOverlay:true text:@""];
}

+ (void)showLoaderWithOverlay: (BOOL)overLay text: (NSString *)text {
    [YXSpritesLoadingView showWithOverLay:overLay andText:[StaticClass removeNull:text]];
}

+ (void)showLoaderWithOverlay: (BOOL)overLay {
    [self showLoaderWithOverlay:overLay text:@""];
}

+ (void)dismissLoader {
    [YXSpritesLoadingView dismiss];
}

@end
