//
//  LTUIButtonDecorations.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIButtonDecorations.h"
#import "LTUIButtonDecorations_Private.h"

@implementation LTUIButtonDecorations
{
    NSMutableDictionary<NSNumber*, UIColor*>* _backgroundColorsForStates;
    NSMutableDictionary<NSNumber*, UIImage*>* _backgroundImagesForStates;
    NSMutableDictionary<NSNumber*, UIImage*>* _imagesForStates;
    NSMutableDictionary<NSNumber*, NSString*>* _titlesForStates;
    NSMutableDictionary<NSNumber*, UIColor*>* _titleColorsForStates;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _backgroundColorsForStates = [NSMutableDictionary dictionaryWithCapacity:4];
        _backgroundImagesForStates = [NSMutableDictionary dictionaryWithCapacity:4];
        _imagesForStates = [NSMutableDictionary dictionaryWithCapacity:4];
        _titlesForStates = [NSMutableDictionary dictionaryWithCapacity:4];
        _titleColorsForStates = [NSMutableDictionary dictionaryWithCapacity:4];
    }
    return self;
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state
{
    if (color == nil)
        return;
    
    _titleColorsForStates[@(state)] = color;
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    if (image == nil)
        return;
    
    _imagesForStates[@(state)] = image;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    if (title == nil)
        return;
    
    _titlesForStates[@(state)] = title;
}

- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state
{
    if (image == nil)
        return;
    
    _backgroundImagesForStates[@(state)] = image;
}

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state
{
    if (color == nil)
        return;
    
    _backgroundColorsForStates[@(state)] = color;
}

- (NSMutableDictionary*)titleColorsForStates
{
    return _titleColorsForStates;
}

- (NSMutableDictionary*)titlesForStates
{
    return _titlesForStates;
}

- (NSMutableDictionary*)backgroundImagesForStates
{
    return _backgroundImagesForStates;
}

- (NSMutableDictionary*)backgroundColorsForStates
{
    return _backgroundColorsForStates;
}

- (NSMutableDictionary*)imagesForStates
{
    return _imagesForStates;
}

- (void)setTitleColorForAllStates:(UIColor *)titleColorForAllStates
{
    _titleColorForAllStates = titleColorForAllStates;
    
    [self.class forAllStates:^(UIControlState state) {
        [self setTitleColor:titleColorForAllStates forState:state];
    }];
}

- (void)setImageForAllStates:(UIImage *)imageForAllStates
{
    _imageForAllStates = imageForAllStates;
    
    [self.class forAllStates:^(UIControlState state) {
        [self setImage:imageForAllStates forState:state];
    }];
}

- (void)setTitleForAllStates:(NSString *)titleForAllStates
{
    _titleForAllStates = titleForAllStates;
    
    [self.class forAllStates:^(UIControlState state) {
        [self setTitle:titleForAllStates forState:state];
    }];
}

- (void)setBackgroundImageForAllStates:(UIImage *)backgroundImageForAllStates
{
    _backgroundImageForAllStates = backgroundImageForAllStates;
    
    [self.class forAllStates:^(UIControlState state) {
        [self setBackgroundImage:backgroundImageForAllStates forState:state];
    }];
}

+ (void)forAllStates:(void (^)(UIControlState))block
{
    if (block == nil)
        return;
    
    block(UIControlStateNormal);
    block(UIControlStateSelected);
    block(UIControlStateHighlighted);
    block(UIControlStateDisabled);
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    LTUIButtonDecorations *copy = [super copyWithZone:zone];
    
    copy.font = self.font.copy;
    copy.contentEdgeInsets = self.contentEdgeInsets;
    copy.titleEdgeInsets = self.titleEdgeInsets;
    copy.imageEdgeInsets = self.imageEdgeInsets;
    copy->_backgroundImagesForStates = _backgroundImagesForStates.mutableCopy;
    copy->_titleColorsForStates = _titleColorsForStates.mutableCopy;
    copy->_imagesForStates = _imagesForStates.mutableCopy;
    copy->_titlesForStates = _titlesForStates.mutableCopy;
    copy->_backgroundColorsForStates = _backgroundColorsForStates.mutableCopy;
    
    return copy;
}

@end
