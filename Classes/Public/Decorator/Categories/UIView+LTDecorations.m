//
//  UIView+LTDecorations.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "UIView+LTDecorations.h"
#import "LTUIViewDecorator.h"

@implementation UIView (LTDecorations)

- (LTUIViewDecorations*)lt_decorations
{
    LTUIViewDecorator* decorator = [[LTUIViewDecorator alloc] initWithView:self];
    return decorator.decorations;
}

- (void)lt_applyDecorations:(LTUIViewDecorations*)decorations
{
    LTUIViewDecorator* decorator = [[LTUIViewDecorator alloc] initWithDecorations:decorations];
    [decorator applyDecorationsOnView:self];
}

@end
