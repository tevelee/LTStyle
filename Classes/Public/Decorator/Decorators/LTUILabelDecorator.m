//
//  LTUILabelDecorator.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUILabelDecorator.h"

@implementation LTUILabelDecorator

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.numberOfLines = 1;
        self.lineBreakMode = NSLineBreakByTruncatingTail;
        self.textAlignment = NSTextAlignmentLeft;
    }
    return self;
}

- (instancetype)initWithView:(UILabel *)label
{
    self = [super initWithView:label];
    if (self)
    {
        self.text = label.text;
        self.attributedText = label.attributedText;
        self.font = label.font;
        self.textColor = label.textColor;
        self.lineBreakMode = label.lineBreakMode;
        self.textAlignment = label.textAlignment;
        self.numberOfLines = label.numberOfLines;
    }
    return self;
}

- (void)applyDecorationsOnView:(UILabel *)label
{
    [super applyDecorationsOnView:label];

    label.text = self.text;
    label.attributedText = self.attributedText;
    label.font = self.font;
    label.textColor = self.textColor;
    label.lineBreakMode = self.lineBreakMode;
    label.textAlignment = self.textAlignment;
    label.numberOfLines = self.numberOfLines;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    LTUILabelDecorator *copy = [super copyWithZone:zone];

    copy.text = self.text;
    copy.attributedText = self.attributedText;
    copy.font = self.font.copy;
    copy.textColor = self.textColor.copy;
    copy.lineBreakMode = self.lineBreakMode;
    copy.textAlignment = self.textAlignment;
    copy.numberOfLines = self.numberOfLines;

    return copy;
}

@end
