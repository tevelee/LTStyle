//
//  LTUIViewDecorations.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIViewDecorations.h"

@implementation LTUIViewDecorations

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

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    LTUIViewDecorations *copy = [[self.class allocWithZone:zone] init];
    
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
