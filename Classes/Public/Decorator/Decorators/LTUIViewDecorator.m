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

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.alpha = 1.0;
        self.clipsToBounds = YES;
        self.opaque = YES;
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (instancetype)initWithView:(UIView *)view
{
    self = [super init];
    if (self)
    {
        self.backgroundColor = view.backgroundColor;
        self.alpha = view.alpha;
        self.clipsToBounds = view.clipsToBounds;
        self.clearsContextBeforeDrawing = view.clearsContextBeforeDrawing;
        self.opaque = view.isOpaque;
        self.hidden = view.isHidden;
        self.contentMode = view.contentMode;
        self.tintColor = view.tintColor;
        self.userInteractionEnabled = view.userInteractionEnabled;

        self.shadowColor = [UIColor colorWithCGColor:view.layer.shadowColor];
        self.shadowOpacity = view.layer.shadowOpacity;
        self.shadowOffset = view.layer.shadowOffset;
        self.shadowRadius = view.layer.shadowRadius;

        self.cornerRadius = view.layer.cornerRadius;

        self.borderWidth = view.layer.borderWidth;
        self.borderColor = [UIColor colorWithCGColor:view.layer.borderColor];
    }
    return self;
}

- (void)setBorderColor:(UIColor *)borderColor width:(CGFloat)borderWidth
{
    [self setBorderColor:borderColor];
    [self setBorderWidth:borderWidth];
}

- (void)setShadowColor:(UIColor *)shadowColor x:(CGFloat)x y:(CGFloat)y blur:(CGFloat)blur opacity:(CGFloat)opacity
{
    [self setShadowColor:shadowColor];
    [self setShadowRadius:blur];
    [self setShadowOpacity:opacity];
    [self setShadowOffset:CGSizeMake(x, y)];
}

- (void)applyDecorationsOnView:(UIView *)view
{
    view.backgroundColor = self.backgroundColor;
    view.alpha = self.alpha;
    view.clipsToBounds = self.clipsToBounds;
    view.clearsContextBeforeDrawing = self.clearsContextBeforeDrawing;
    view.opaque = self.isOpaque;
    view.hidden = self.isHidden;
    view.contentMode = self.contentMode;
    view.tintColor = self.tintColor;
    view.userInteractionEnabled = self.userInteractionEnabled;

    view.layer.shadowColor = self.shadowColor.CGColor;
    view.layer.shadowOpacity = self.shadowOpacity;
    view.layer.shadowOffset = self.shadowOffset;
    view.layer.shadowRadius = self.shadowRadius;

    view.layer.cornerRadius = self.cornerRadius;

    view.layer.borderWidth = self.borderWidth;
    view.layer.borderColor = self.borderColor.CGColor;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    LTUIViewDecorator *copy = [[self.class allocWithZone:zone] init];

    copy.backgroundColor = self.backgroundColor.copy;
    copy.alpha = self.alpha;
    copy.clipsToBounds = self.clipsToBounds;
    copy.clearsContextBeforeDrawing = self.clearsContextBeforeDrawing;
    copy.opaque = self.isOpaque;
    copy.hidden = self.isHidden;
    copy.contentMode = self.contentMode;
    copy.tintColor = self.tintColor.copy;
    copy.userInteractionEnabled = self.userInteractionEnabled;

    copy.shadowColor = self.shadowColor.copy;
    copy.shadowOpacity = self.shadowOpacity;
    copy.shadowOffset = self.shadowOffset;
    copy.shadowRadius = self.shadowRadius;

    copy.cornerRadius = self.cornerRadius;

    copy.borderWidth = self.borderWidth;
    copy.borderColor = self.borderColor.copy;

    return copy;
}

@end
