//
//  UIControl+LTDecorations.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "UIControl+LTDecorations.h"
#import "LTUIControlDecorator.h"

@implementation UIControl (LTDecorations)

- (LTUIControlDecorations*)lt_decorations
{
    LTUIControlDecorator* decorator = [[LTUIControlDecorator alloc] initWithView:self];
    return decorator.decorations;
}

- (void)lt_applyDecorations:(LTUIControlDecorations*)decorations
{
    LTUIControlDecorator* decorator = [[LTUIControlDecorator alloc] initWithDecorations:decorations];
    [decorator applyDecorationsOnView:self];
}

@end
