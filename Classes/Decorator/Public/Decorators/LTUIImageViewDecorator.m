//
//  LTUIImageViewDecorator.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIImageViewDecorator.h"
#import "LTUIViewDecorator_Private.h"

@implementation LTUIImageViewDecorator

+ (LTUIImageViewDecorations*)decorationsFromView:(UIImageView*)imageView
{
    LTUIImageViewDecorations* decorations = [super decorationsFromView:imageView];
    
    decorations.image = imageView.image;
    
    return decorations;
}

+ (void)applyDecorations:(LTUIImageViewDecorations*)decorations onView:(UIImageView*)imageView
{
    [super applyDecorations:decorations onView:imageView];

    imageView.image = decorations.image;
}

@end
