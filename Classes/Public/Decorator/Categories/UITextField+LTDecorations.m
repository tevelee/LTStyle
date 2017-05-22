//
//  UITextField+LTDecorations.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "UITextField+LTDecorations.h"
#import "LTUITextFieldDecorator.h"

@implementation UITextField (LTDecorations)

- (LTUITextFieldDecorations*)lt_decorations
{
    LTUITextFieldDecorator* decorator = [[LTUITextFieldDecorator alloc] initWithView:self];
    return decorator.decorations;
}

- (void)lt_applyDecorations:(LTUITextFieldDecorations*)decorations
{
    LTUITextFieldDecorator* decorator = [[LTUITextFieldDecorator alloc] initWithDecorations:decorations];
    [decorator applyDecorationsOnView:self];
}

@end
