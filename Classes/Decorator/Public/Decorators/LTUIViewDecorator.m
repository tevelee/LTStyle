//
//  LTUIViewDecorator.m
//  Pods
//
//  Created by Daniel Nagy on 12/13/16.
//
//

#import "LTUIViewDecorator.h"
#import <objc/runtime.h>

@implementation LTUIViewDecorator

#pragma mark Init

- (instancetype)init
{
    LTUIViewDecorations* decorations = [LTUIViewDecorations new];
    return [self initWithDecorations:decorations];
}

- (instancetype)initWithView:(UIView *)view
{
    LTUIViewDecorations* decorations = [self.class decorationsFromView:view];
    return [self initWithDecorations:decorations];
}

- (instancetype)initWithDecorations:(LTUIViewDecorations *)decorations
{
    self = [super init];
    if (self) {
        self.decorations = decorations.copy;
    }
    return self;
}

#pragma mark Apply

- (void)applyDecorationsOnView:(UIView *)view
{
    [self.class applyDecorations:self.decorations onView:view];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    LTUIViewDecorator *copy = [[self.class allocWithZone:zone] init];

    copy.decorations = self.decorations.copy;
    
    return copy;
}

#pragma mark - Decorations

#pragma mark Get

+ (LTUIViewDecorations*)decorationsFromView:(UIView*)view
{
    LTUIViewDecorations* decorations = [LTUIViewDecorations new];
    
    decorations.backgroundColor = view.backgroundColor;
    decorations.alpha = view.alpha;
    decorations.clipsToBounds = view.clipsToBounds;
    decorations.clearsContextBeforeDrawing = view.clearsContextBeforeDrawing;
    decorations.opaque = view.isOpaque;
    decorations.hidden = view.isHidden;
    decorations.contentMode = view.contentMode;
    decorations.tintColor = view.tintColor;
    decorations.userInteractionEnabled = view.userInteractionEnabled;
    
    decorations.shadowColor = [UIColor colorWithCGColor:view.layer.shadowColor];
    decorations.shadowOpacity = view.layer.shadowOpacity;
    decorations.shadowOffset = view.layer.shadowOffset;
    decorations.shadowRadius = view.layer.shadowRadius;
    
    decorations.cornerRadius = view.layer.cornerRadius;
    
    decorations.borderWidth = view.layer.borderWidth;
    decorations.borderColor = [UIColor colorWithCGColor:view.layer.borderColor];
    
    return decorations;
}

#pragma mark Set

+ (void)applyDecorations:(LTUIViewDecorations*)decorations onView:(UIView *)view
{
    view.backgroundColor = decorations.backgroundColor;
    view.alpha = decorations.alpha;
    view.clipsToBounds = decorations.clipsToBounds;
    view.clearsContextBeforeDrawing = decorations.clearsContextBeforeDrawing;
    view.opaque = decorations.isOpaque;
    view.hidden = decorations.isHidden;
    view.contentMode = decorations.contentMode;
    view.tintColor = decorations.tintColor;
    view.userInteractionEnabled = decorations.userInteractionEnabled;
    
    view.layer.shadowColor = decorations.shadowColor.CGColor;
    view.layer.shadowOpacity = decorations.shadowOpacity;
    view.layer.shadowOffset = decorations.shadowOffset;
    view.layer.shadowRadius = decorations.shadowRadius;
    
    view.layer.cornerRadius = decorations.cornerRadius;
    
    view.layer.borderWidth = decorations.borderWidth;
    view.layer.borderColor = decorations.borderColor.CGColor;
}

@end
