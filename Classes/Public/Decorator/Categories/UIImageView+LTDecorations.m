//
//  UIImageView+LTDecorations.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "UIImageView+LTDecorations.h"
#import "LTUIImageViewDecorator.h"

@implementation UIImageView (LTDecorations)

- (LTUIImageViewDecorations*)lt_decorations
{
    LTUIImageViewDecorator* decorator = [[LTUIImageViewDecorator alloc] initWithView:self];
    return decorator.decorations;
}

- (void)lt_applyDecorations:(LTUIImageViewDecorations*)decorations
{
    LTUIImageViewDecorator* decorator = [[LTUIImageViewDecorator alloc] initWithDecorations:decorations];
    [decorator applyDecorationsOnView:self];
}

@end
