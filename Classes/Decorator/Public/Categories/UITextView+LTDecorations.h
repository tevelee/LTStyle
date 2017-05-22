//
//  UITextView+LTDecorations.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import <UIKit/UIKit.h>
#import "LTUITextViewDecorations.h"

@interface UITextView (LTDecorations)

- (LTUITextViewDecorations*)lt_decorations;
- (void)lt_applyDecorations:(LTUITextViewDecorations*)decorations;

@end
