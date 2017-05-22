//
//  LTUIImageViewDecorator.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIImageViewDecorator.h"

@implementation LTUIImageViewDecorator

- (instancetype)initWithView:(UIImageView *)imageView
{
    self = [super initWithView:imageView];
    if (self)
    {
        self.image = imageView.image;
    }
    return self;
}

- (void)applyDecorationsOnView:(UIImageView *)imageView
{
    [super applyDecorationsOnView:imageView];

    imageView.image = self.image;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    LTUIImageViewDecorator *copy = [super copyWithZone:zone];

    copy.image = self.image.copy;

    return copy;
}

@end
