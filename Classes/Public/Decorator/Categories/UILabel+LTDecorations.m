//
//  UILabel+LTDecorations.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "UILabel+LTDecorations.h"
#import "LTUILabelDecorator.h"

@implementation UILabel (LTDecorations)

- (LTUILabelDecorations*)lt_decorations
{
    LTUILabelDecorator* decorator = [[LTUILabelDecorator alloc] initWithView:self];
    return decorator.decorations;
}

- (void)lt_applyDecorations:(LTUILabelDecorations*)decorations
{
    LTUILabelDecorator* decorator = [[LTUILabelDecorator alloc] initWithDecorations:decorations];
    [decorator applyDecorationsOnView:self];
}

@end
