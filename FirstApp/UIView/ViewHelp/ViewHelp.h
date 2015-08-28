//
//  ViewHelp.h
//  Parade Smith
//
//  Created by Tops on 8/6/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewHelp : UIView
{
    IBOutlet UILabel *lblMessage;
    IBOutlet UITextView *txtMessage;
}
@property (strong,nonatomic)IBOutlet UILabel *lblMessage;
@property (strong,nonatomic)IBOutlet UITextView *txtMessage;
- (void)ViewDisplay;
- (void)openView;
@end
