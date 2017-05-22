//
//  LTUIImageViewDecorations.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIImageViewDecorations.h"

@implementation LTUIImageViewDecorations

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    LTUIImageViewDecorations *copy = [super copyWithZone:zone];
    
    copy.image = self.image.copy;
    
    return copy;
}

@end
