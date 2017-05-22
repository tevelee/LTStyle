//
//  LTUILabelDecorator.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUILabelDecorator.h"
#import "LTUIViewDecorator_Private.h"

@implementation LTUILabelDecorator

#pragma mark - Decorations

#pragma mark Get

+ (LTUILabelDecorations*)decorationsFromView:(UILabel*)label
{
    LTUILabelDecorations* decorations = [super decorationsFromView:label];
    
    decorations.text = label.text;
    decorations.attributedText = label.attributedText;
    decorations.font = label.font;
    decorations.textColor = label.textColor;
    decorations.lineBreakMode = label.lineBreakMode;
    decorations.textAlignment = label.textAlignment;
    decorations.numberOfLines = label.numberOfLines;

    return decorations;
}

#pragma mark Set

+ (void)applyDecorations:(LTUILabelDecorations*)decorations onView:(UILabel*)label
{
    [super applyDecorations:decorations onView:label];
    
    label.text = decorations.text;
    label.attributedText = decorations.attributedText;
    label.font = decorations.font;
    label.textColor = decorations.textColor;
    label.lineBreakMode = decorations.lineBreakMode;
    label.textAlignment = decorations.textAlignment;
    label.numberOfLines = decorations.numberOfLines;
}

@end
