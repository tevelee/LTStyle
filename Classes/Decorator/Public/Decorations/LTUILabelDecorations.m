//
//  LTUILabelDecorations.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUILabelDecorations.h"

@implementation LTUILabelDecorations

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

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    LTUILabelDecorations *copy = [super copyWithZone:zone];
    
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
