//
//  LTUIButtonDecorator.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIButtonDecorator.h"
#import "LTUIViewDecorator_Private.h"
#import "LTUIButtonDecorations_Private.h"

@implementation LTUIButtonDecorator

+ (LTUIButtonDecorations*)decorationsFromView:(UIButton*)button
{
    LTUIButtonDecorations* decorations = [super decorationsFromView:button];
    
    decorations.font = button.titleLabel.font;
    decorations.contentEdgeInsets = button.contentEdgeInsets;
    decorations.titleEdgeInsets = button.titleEdgeInsets;
    decorations.imageEdgeInsets = button.imageEdgeInsets;
    
    [decorations.class forAllStates:^(UIControlState state) {
        UIImage *image = [button backgroundImageForState:state];
        if (image) {
            [decorations setBackgroundImage:image forState:state];
        }
    }];
    
    [decorations.class forAllStates:^(UIControlState state) {
        UIColor *color = [button titleColorForState:state];
        if (color) {
            [decorations setTitleColor:color forState:state];
        }
    }];
    
    [decorations.class forAllStates:^(UIControlState state) {
        UIImage *image = [button imageForState:state];
        if (image) {
            [decorations setImage:image forState:state];
        }
    }];
    
    [decorations.class forAllStates:^(UIControlState state) {
        NSString *title = [button titleForState:state];
        if (title) {
            [decorations setTitle:title forState:state];
        }
    }];
    
    return decorations;
}

+ (void)applyDecorations:(LTUIButtonDecorations*)decorations onView:(UIButton*)button
{
    [super applyDecorations:decorations onView:button];
    
    button.titleLabel.font = decorations.font;
    button.contentEdgeInsets = decorations.contentEdgeInsets;
    button.titleEdgeInsets = decorations.titleEdgeInsets;
    button.imageEdgeInsets = decorations.imageEdgeInsets;

    for (NSNumber *state in decorations.backgroundImagesForStates)
        [button setBackgroundImage:decorations.backgroundImagesForStates[state] forState:state.integerValue];

    for (NSNumber *state in decorations.titleColorsForStates)
        [button setTitleColor:decorations.titleColorsForStates[state] forState:state.integerValue];

    for (NSNumber *state in decorations.imagesForStates)
        [button setImage:decorations.imagesForStates[state] forState:state.integerValue];

    for (NSNumber *state in decorations.titlesForStates)
        [button setTitle:decorations.titlesForStates[state] forState:state.integerValue];
}

- (instancetype)initWithView:(UIButton *)button
{
    self = [super initWithView:button];
    if (self) {
        if (self.decorations.backgroundColorsForStates.count > 0)
        {
            [button addTarget:self action:@selector(buttonStateChanged:) forControlEvents:UIControlEventAllTouchEvents];
            [self buttonStateChanged:button];
        }
    }
    return self;
}

- (void)buttonStateChanged:(UIButton *)button
{
    NSDictionary* backgroundColorsForStates = self.decorations.backgroundColorsForStates;
    UIColor *color = backgroundColorsForStates[@(button.state)] ?: backgroundColorsForStates[@(UIControlStateNormal)];
    if (color) {
        [button setBackgroundColor:color];
    }
}

@end
