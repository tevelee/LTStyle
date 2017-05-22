//
//  LTUIControlDecorator.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIControlDecorator.h"

@implementation LTUIControlDecorator

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.enabled = YES;
    }
    return self;
}

- (instancetype)initWithView:(UIControl *)control
{
    self = [super initWithView:control];
    if (self)
    {
        self.enabled = control.isEnabled;
        self.selected = control.isSelected;
        self.highlighted = control.isHighlighted;
        self.contentVerticalAlignment = control.contentVerticalAlignment;
        self.contentHorizontalAlignment = control.contentHorizontalAlignment;
    }
    return self;
}

- (void)applyDecorationsOnView:(UIControl *)control
{
    [super applyDecorationsOnView:control];

    control.enabled = self.isEnabled;
    control.selected = self.isSelected;
    control.highlighted = self.isHighlighted;
    control.contentVerticalAlignment = self.contentVerticalAlignment;
    control.contentHorizontalAlignment = self.contentHorizontalAlignment;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    LTUIControlDecorator *copy = [super copyWithZone:zone];

    copy.enabled = self.isEnabled;
    copy.selected = self.isSelected;
    copy.highlighted = self.isHighlighted;
    copy.contentVerticalAlignment = self.contentVerticalAlignment;
    copy.contentHorizontalAlignment = self.contentHorizontalAlignment;

    return copy;
}

@end
