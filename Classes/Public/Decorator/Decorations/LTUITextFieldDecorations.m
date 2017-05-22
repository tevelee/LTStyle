//
//  LTUITextFieldDecorations.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUITextFieldDecorations.h"

@implementation LTUITextFieldDecorations

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.textAlignment = NSTextAlignmentLeft;
        self.borderStyle = UITextBorderStyleNone;
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    LTUITextFieldDecorations *copy = [super copyWithZone:zone];
    
    copy.text = self.text;
    copy.attributedText = self.attributedText;
    copy.textColor = self.textColor.copy;
    copy.font = self.font.copy;
    copy.textAlignment = self.textAlignment;
    copy.borderStyle = self.borderStyle;
    copy.defaultTextAttributes = self.defaultTextAttributes.copy;
    copy.typingAttributes = self.typingAttributes.copy;
    copy.clearsOnBeginEditing = self.clearsOnBeginEditing;
    copy.background = self.background.copy;
    copy.disabledBackground = self.disabledBackground.copy;
    copy.allowsEditingTextAttributes = self.allowsEditingTextAttributes;
    copy.leftView = self.leftView;
    copy.rightView = self.rightView;
    copy.leftViewMode = self.leftViewMode;
    copy.rightViewMode = self.rightViewMode;
    copy.clearButtonMode = self.clearButtonMode;
    
    return copy;
}

@end
