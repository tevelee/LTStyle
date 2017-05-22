//
//  UIButton+LTDecorations.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "UIButton+LTDecorations.h"
#import "LTUIButtonDecorator.h"

@implementation UIButton (LTDecorations)

- (LTUIButtonDecorations*)lt_decorations
{
    LTUIButtonDecorator* decorator = [[LTUIButtonDecorator alloc] initWithView:self];
    return decorator.decorations;
}

- (void)lt_applyDecorations:(LTUIButtonDecorations*)decorations
{
    LTUIButtonDecorator* decorator = [[LTUIButtonDecorator alloc] initWithDecorations:decorations];
    [decorator applyDecorationsOnView:self];
}

@end
