//
//  LTUIButtonDecorator.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIButtonDecorator.h"

@implementation LTUIButtonDecorator
{
    NSMutableDictionary *_backgroundColorsForStates;
    NSMutableDictionary *_backgroundImagesForStates;
    NSMutableDictionary *_imagesForStates;
    NSMutableDictionary *_titlesForStates;
    NSMutableDictionary *_titleColorsForStates;
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

- (instancetype)initWithView:(UIButton *)button
{
    self = [super initWithView:button];
    if (self)
    {
        _backgroundColorsForStates = [NSMutableDictionary dictionaryWithCapacity:4];
        _backgroundImagesForStates = [NSMutableDictionary dictionaryWithCapacity:4];
        _imagesForStates = [NSMutableDictionary dictionaryWithCapacity:4];
        _titlesForStates = [NSMutableDictionary dictionaryWithCapacity:4];
        _titleColorsForStates = [NSMutableDictionary dictionaryWithCapacity:4];

        self.font = button.titleLabel.font;
        self.contentEdgeInsets = button.contentEdgeInsets;
        self.titleEdgeInsets = button.titleEdgeInsets;
        self.imageEdgeInsets = button.imageEdgeInsets;

        __weak __typeof__(self) weakSelf = self;
        [self forAllStates:^(UIControlState state) {
            UIImage *image = [button backgroundImageForState:state];
            if (image)
            {
                __typeof__(self) strongSelf = weakSelf;
                strongSelf->_backgroundImagesForStates[@(state)] = image;
            }
        }];

        [self forAllStates:^(UIControlState state) {
            UIColor *color = [button titleColorForState:state];
            if (color)
            {
                __typeof__(self) strongSelf = weakSelf;
                strongSelf->_titleColorsForStates[@(state)] = color;
            }
        }];

        [self forAllStates:^(UIControlState state) {
            UIImage *image = [button imageForState:state];
            if (image)
            {
                __typeof__(self) strongSelf = weakSelf;
                strongSelf->_imagesForStates[@(state)] = image;
            }
        }];

        [self forAllStates:^(UIControlState state) {
            NSString *title = [button titleForState:state];
            if (title)
            {
                __typeof__(self) strongSelf = weakSelf;
                strongSelf->_titlesForStates[@(state)] = title;
            }
        }];
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

- (void)setTitleColorForAllStates:(UIColor *)titleColorForAllStates
{
    _titleColorForAllStates = titleColorForAllStates;

    [self forAllStates:^(UIControlState state) {
        [self setTitleColor:titleColorForAllStates forState:state];
    }];
}

- (void)setImageForAllStates:(UIImage *)imageForAllStates
{
    _imageForAllStates = imageForAllStates;

    [self forAllStates:^(UIControlState state) {
        [self setImage:imageForAllStates forState:state];
    }];
}

- (void)setTitleForAllStates:(NSString *)titleForAllStates
{
    _titleForAllStates = titleForAllStates;

    [self forAllStates:^(UIControlState state) {
        [self setTitle:titleForAllStates forState:state];
    }];
}

- (void)setBackgroundImageForAllStates:(UIImage *)backgroundImageForAllStates
{
    _backgroundImageForAllStates = backgroundImageForAllStates;

    [self forAllStates:^(UIControlState state) {
        [self setBackgroundImage:backgroundImageForAllStates forState:state];
    }];
}

- (void)forAllStates:(void (^)(UIControlState))block
{
    if (block == nil)
        return;

    block(UIControlStateNormal);
    block(UIControlStateSelected);
    block(UIControlStateHighlighted);
    block(UIControlStateDisabled);
}

- (void)applyDecorationsOnView:(UIButton *)button
{
    [super applyDecorationsOnView:button];

    button.titleLabel.font = self.font;
    button.contentEdgeInsets = self.contentEdgeInsets;
    button.titleEdgeInsets = self.titleEdgeInsets;
    button.imageEdgeInsets = self.imageEdgeInsets;

    for (NSNumber *state in _backgroundImagesForStates)
        [button setBackgroundImage:_backgroundImagesForStates[state] forState:state.integerValue];

    for (NSNumber *state in _titleColorsForStates)
        [button setTitleColor:_titleColorsForStates[state] forState:state.integerValue];

    for (NSNumber *state in _imagesForStates)
        [button setImage:_imagesForStates[state] forState:state.integerValue];

    for (NSNumber *state in _titlesForStates)
        [button setTitle:_titlesForStates[state] forState:state.integerValue];

    if (_backgroundColorsForStates.count > 0)
    {
        [button addTarget:self action:@selector(buttonStateChanged:) forControlEvents:UIControlEventAllTouchEvents];
        [self buttonStateChanged:button];
    }
}

- (void)buttonStateChanged:(UIButton *)button
{
    UIColor *color = _backgroundColorsForStates[@(button.state)] ?: _backgroundColorsForStates[@(UIControlStateNormal)];
    if (color)
        [button setBackgroundColor:color];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    LTUIButtonDecorator *copy = [super copyWithZone:zone];

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
