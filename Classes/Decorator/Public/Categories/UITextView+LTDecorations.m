//
//  UITextView+LTDecorations.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "UITextView+LTDecorations.h"
#import "LTUITextViewDecorator.h"

@implementation UITextView (LTDecorations)

- (LTUITextViewDecorations*)lt_decorations
{
    LTUITextViewDecorator* decorator = [[LTUITextViewDecorator alloc] initWithView:self];
    return decorator.decorations;
}

- (void)lt_applyDecorations:(LTUITextViewDecorations*)decorations
{
    LTUITextViewDecorator* decorator = [[LTUITextViewDecorator alloc] initWithDecorations:decorations];
    [decorator applyDecorationsOnView:self];
}

@end
