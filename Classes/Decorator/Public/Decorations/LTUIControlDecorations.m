//
//  LTUIControlDecorations.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIControlDecorations.h"

@implementation LTUIControlDecorations

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.enabled = YES;
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    LTUIControlDecorations *copy = [super copyWithZone:zone];
    
    copy.enabled = self.isEnabled;
    copy.selected = self.isSelected;
    copy.highlighted = self.isHighlighted;
    copy.contentVerticalAlignment = self.contentVerticalAlignment;
    copy.contentHorizontalAlignment = self.contentHorizontalAlignment;
    
    return copy;
}

@end
