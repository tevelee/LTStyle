//
//  LTUITextFieldDecorator.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUITextFieldDecorator.h"

@implementation LTUITextFieldDecorator

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

- (instancetype)initWithView:(UITextField *)textField
{
    self = [super initWithView:textField];
    if (self)
    {
        self.text = textField.text;
        self.attributedText = textField.attributedText;
        self.textColor = textField.textColor;
        self.font = textField.font;
        self.textAlignment = textField.textAlignment;
        self.borderStyle = textField.borderStyle;
        self.defaultTextAttributes = textField.defaultTextAttributes;
        self.typingAttributes = textField.typingAttributes;
        self.clearsOnBeginEditing = textField.clearsOnBeginEditing;
        self.background = textField.background;
        self.disabledBackground = textField.disabledBackground;
        self.allowsEditingTextAttributes = textField.allowsEditingTextAttributes;
        self.leftView = textField.leftView;
        self.rightView = textField.rightView;
        self.leftViewMode = textField.leftViewMode;
        self.rightViewMode = textField.rightViewMode;
        self.clearButtonMode = textField.clearButtonMode;
    }
    return self;
}

- (void)applyDecorationsOnView:(UITextField *)textField
{
    [super applyDecorationsOnView:textField];

    textField.text = self.text;
    textField.attributedText = self.attributedText;
    textField.textColor = self.textColor;
    textField.font = self.font;
    textField.textAlignment = self.textAlignment;
    textField.borderStyle = self.borderStyle;
    textField.defaultTextAttributes = self.defaultTextAttributes;
    textField.typingAttributes = self.typingAttributes;
    textField.clearsOnBeginEditing = self.clearsOnBeginEditing;
    textField.background = self.background;
    textField.disabledBackground = self.disabledBackground;
    textField.allowsEditingTextAttributes = self.allowsEditingTextAttributes;
    textField.leftView = self.leftView;
    textField.rightView = self.rightView;
    textField.leftViewMode = self.leftViewMode;
    textField.rightViewMode = self.rightViewMode;
    textField.clearButtonMode = self.clearButtonMode;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    LTUITextFieldDecorator *copy = [super copyWithZone:zone];

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
