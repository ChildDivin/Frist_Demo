//
//  ViewHelp.m
//  Parade Smith
//
//  Created by Tops on 8/6/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "ViewHelp.h"

@interface ViewHelp ()

@end

@implementation ViewHelp
@synthesize lblMessage,txtMessage;
- (void)awakeFromNib {
    [super awakeFromNib];
  //UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btnHide:)];
  //  [self addGestureRecognizer:tapGestureRecognizer];
}
- (void)openView {
    lblMessage.text=@"";
}
- (void)ViewDisplay {
    CGSize size = [StaticClass getSizeOfString:txtMessage.text width:txtMessage.frame.size.width font:txtMessage.font minimumHeight:25];
    if (size.height>360) {
        size.height=360;
    }
    self.layer.cornerRadius=2.0;
    
     [txtMessage setFrame:CGRectMake(txtMessage.frame.origin.x,txtMessage.frame.origin.y,txtMessage.frame.size.width-5,size.height+20)];
    
    [self setFrame:CGRectMake(self.frame.origin.x,self.frame.origin.y,txtMessage.frame.size.width+10,txtMessage.frame.size.height+15)];
}
- (IBAction)btnHide:(id)sender {
    lblMessage.text=@"";
    [[KGModal sharedInstance] hideAnimated:true];
}
@end
