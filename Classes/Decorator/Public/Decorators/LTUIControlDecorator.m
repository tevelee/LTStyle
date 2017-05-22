//
//  LTUIControlDecorator.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIControlDecorator.h"
#import "LTUIViewDecorator_Private.h"

@implementation LTUIControlDecorator

+ (LTUIControlDecorations*)decorationsFromView:(UIControl*)control
{
    LTUIControlDecorations* decorations = [super decorationsFromView:control];
    
    decorations.enabled = control.isEnabled;
    decorations.selected = control.isSelected;
    decorations.highlighted = control.isHighlighted;
    decorations.contentVerticalAlignment = control.contentVerticalAlignment;
    decorations.contentHorizontalAlignment = control.contentHorizontalAlignment;
    
    return decorations;
}

+ (void)applyDecorations:(LTUIControlDecorations*)decorations onView:(UIControl*)control
{
    [super applyDecorations:decorations onView:control];

    control.enabled = decorations.isEnabled;
    control.selected = decorations.isSelected;
    control.highlighted = decorations.isHighlighted;
    control.contentVerticalAlignment = decorations.contentVerticalAlignment;
    control.contentHorizontalAlignment = decorations.contentHorizontalAlignment;
}

@end
