//
//  YXSpritesLoadingView.h
//  Gogobot-iOS
//
//  Created by Yin Xu on 05/14/14.
//  Copyright (c) 2014 Yin Xu. All rights reserved.
//

#import "YXSpritesLoadingView.h"
#import "UIImage+animatedGIF.h"

@implementation YXSpritesLoadingView
{
    UIView *loaderView;
    UIImageView *loadingImageView;
    UILabel *loadingLabel;
    UIWindow *window;
}

#pragma mark - Class Methods
+ (YXSpritesLoadingView *)sharedInstance
{
	static dispatch_once_t once = 0;
	static YXSpritesLoadingView *sharedInstance;
	dispatch_once(&once, ^{
        sharedInstance = [[YXSpritesLoadingView alloc] init];
    });
	return sharedInstance;
}

+ (void)showWithOverLay:(BOOL)overlay andText: (NSString *)text
{
    [[self sharedInstance] loadingViewSetupWithText:text showOverlay:overlay];
}

+ (void)dismiss
{
    [[self sharedInstance] loadingViewHide];
}


#pragma mark - Initialization Methods
- (id)init
{
    self = [super initWithFrame: [UIScreen mainScreen].bounds];
    self.backgroundColor = [UIColor clearColor];
	id<UIApplicationDelegate> delegate = [[UIApplication sharedApplication] delegate];
    window = [delegate respondsToSelector:@selector(window)] ? [delegate performSelector:@selector(window)] : [[UIApplication sharedApplication] keyWindow];
	self.alpha = 0;
	return self;
}

#pragma mark - Helper Methods
- (void)loadingViewSetupWithText:(NSString *)text showOverlay: (BOOL)overlay {
    if (!loadingImageView) {
        CGFloat textHeight = 0.0;
        loaderView = [[UIView alloc]init];
        loaderView.backgroundColor = loaderBackgroundColor;
        
        if(!overlay) {
            loaderView.layer.cornerRadius = loaderCornerRadius;
        }
        
        if([text isEqualToString:@""]) {
            if(overlay) {
                loaderView.frame = CGRectMake(0, 0, g_ScreenWidth, g_ScreenHeight);
            } else {
                loaderView.frame = CGRectMake((g_ScreenWidth-loaderBackgroundWidth)/2, (g_ScreenHeight-loaderBackgroundHeight)/2, loaderBackgroundWidth, loaderBackgroundHeight);
            }
        } else {
            CGSize size = [StaticClass getSizeOfString:text width:loaderBackgroundWidth-(loadingTextLabelSideMargin*2) font:[UIFont fontWithName:loadingTextFontName size:loadingTextFontSize] minimumHeight:20];
            textHeight = size.height;
            
            if(overlay) {
                loaderView.frame = CGRectMake(0, 0, g_ScreenWidth, g_ScreenHeight);
            } else {
                loaderView.frame = CGRectMake((g_ScreenWidth-loaderBackgroundWidth)/2, (g_ScreenHeight-loaderBackgroundHeight-textHeight)/2, loaderBackgroundWidth, loaderBackgroundHeight+textHeight+loadingTextLabelBottomMargin);
            }
            
            
            loadingLabel = [[UILabel alloc]initWithFrame:CGRectMake(loadingTextLabelSideMargin, loaderView.frame.size.height-textHeight-loadingTextLabelBottomMargin, loaderView.frame.size.width-(loadingTextLabelSideMargin*2), textHeight)];
            loadingLabel.font = [UIFont fontWithName:loadingTextFontName size:loadingTextFontSize];
            loadingLabel.textAlignment = NSTextAlignmentCenter;
            loadingLabel.text = text;
            loadingLabel.textColor = loadingTextColor;
            loadingLabel.numberOfLines = 0;
            [loaderView addSubview:loadingLabel];
        }
        
        loadingImageView = [[UIImageView alloc] init];
        loadingImageView.frame = CGRectMake((loaderView.frame.size.width-animationImageWidth)/2, (loaderView.frame.size.height-animationImageHeight-textHeight)/2, animationImageWidth, animationImageHeight);
        loadingImageView.contentMode = UIViewContentModeScaleToFill;
        loadingImageView.layer.zPosition = MAXFLOAT;
        loadingImageView.image = [UIImage animatedImageWithAnimatedGIFURL:[[NSBundle mainBundle] URLForResource:spriteNameString withExtension:@"gif"]];
        [loaderView addSubview:loadingImageView];
    }
    
    if (loaderView.superview == nil) {
        [window addSubview:loaderView];
    }
    
    loaderView.alpha = 0;
    loaderView.transform = CGAffineTransformScale(loaderView.transform, 1.5, 1.5);

    loaderView.alpha = 1;
    loaderView.transform = CGAffineTransformIdentity;
    
    self.alpha = 1;
}

- (void)loadingViewHide {
    if (self.alpha == 1) {
        loaderView.transform = CGAffineTransformScale(loaderView.transform, 1.5, 1.5);
        loaderView.alpha = 0;
        
        self.alpha = 0;
        [loadingImageView removeFromSuperview];
        [loadingImageView stopAnimating];
        loadingImageView = nil;
        
        [loadingLabel removeFromSuperview];
        loadingLabel = nil;
        
        [loaderView removeFromSuperview];
        loaderView = nil;
    }
}

- (NSArray *)imagesForAnimating {
    NSMutableArray *retVal = [NSMutableArray array];
    for(int i = 0; i < numberOfFramesInAnimation; i++) {
        [retVal addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%@%d",spriteNameString, i]]];
    }
    return retVal;
}

- (void) changeLoadingText: (NSString *)text {
    loadingLabel.text = text;
}

@end
