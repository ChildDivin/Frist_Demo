//
//  YXSpritesLoadingView.h
//  Gogobot-iOS
//
//  Created by Yin Xu on 05/14/14.
//  Copyright (c) 2014 Yin Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

/***************************************************************
 
General Information Here:
 
 - set shouldShimmering to YES will using the FBShimmering effect on loader text label, default to YES. FBShimmering library is included in YXSpritesActivityLoader. Information for FBShimmering library: https://github.com/facebook/Shimmer

***************************************************************/


/***************************************************************
 
 Define Loading Background Attributes Here:
 
 - 85% alpha white is the default color
 - 5 is default Loader Corner Radius
 - set loaderBlurViewShow to YES will have the blur effect on loader background, the background color will be ignored
 
***************************************************************/

#define loaderBlurViewShow NO
#define loaderBackgroundColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6]
#define loaderCornerRadius 10
#define loaderBackgroundWidth 80
#define loaderBackgroundHeight 80

/***************************************************************
 
 Define Animation Attributes Here:
 - cycleAnimationDuration is duration for one cycle of images
 - animationImageWidth & animationImageHeight is the size of the animation image view, but the content mode is UIViewContentModeCenter, so images won't be stretched, set this size carefully, usually large than the sprites
 
 ##IMPORTANT##
 - numberOfFramesInAnimation is total number of sprites in one cycly of animation
 - we suggest to name all your sprite in this format: "name_frameNumber" such as "slice1_0", "slice1_1"....

 
 animation Image Type
 1 - simple png image
 2 - list of png images(to make an gif image)
 3 - gif image
 
***************************************************************/

#define cycleAnimationDuration 0.3
#define animationImageWidth 30
#define animationImageHeight 30
#define numberOfFramesInAnimation 3
#define spriteNameString @"Loading"

#define animationImageType 3

/***************************************************************

 Define Loading Text Attributes Here:
 
 - If you want to hide the loading text label, just set the Text to @""
 - Change the Text Font Name if you want to use custom font, Helvetica bold is default font
 - Font Size 15 is default font
 - Change font size will cause the loader background size change too
 - black is default Text Color
 - loadingTextLabelSideMargin is how much it's away from each side, 10 is the default margin
 - loadingTextLabelSideMargin is how much it's away from the bottom, 10 is the default margin
 
***************************************************************/

#define loadingTextFontName @"Helvetica"
#define loadingTextFontSize 14
#define loadingTextColor [UIColor whiteColor]
#define loadingTextLabelSideMargin 10
#define loadingTextLabelBottomMargin 10

@interface YXSpritesLoadingView : UIView

+ (YXSpritesLoadingView *)sharedInstance;

+ (void)showWithOverLay:(BOOL)overlay andText: (NSString *)text;
+ (void)dismiss;

- (void) changeLoadingText: (NSString *)text;

@end
