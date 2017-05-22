//
//  LTUITextFieldDecorator.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUITextFieldDecorator.h"
#import "LTUIViewDecorator_Private.h"

@implementation LTUITextFieldDecorator

+ (LTUITextFieldDecorations*)decorationsFromView:(UITextField*)textField
{
    LTUITextFieldDecorations* decorations = [LTUITextFieldDecorations new];
    
    decorations.text = textField.text;
    decorations.attributedText = textField.attributedText;
    decorations.textColor = textField.textColor;
    decorations.font = textField.font;
    decorations.textAlignment = textField.textAlignment;
    decorations.borderStyle = textField.borderStyle;
    decorations.defaultTextAttributes = textField.defaultTextAttributes;
    decorations.typingAttributes = textField.typingAttributes;
    decorations.clearsOnBeginEditing = textField.clearsOnBeginEditing;
    decorations.background = textField.background;
    decorations.disabledBackground = textField.disabledBackground;
    decorations.allowsEditingTextAttributes = textField.allowsEditingTextAttributes;
    decorations.leftView = textField.leftView;
    decorations.rightView = textField.rightView;
    decorations.leftViewMode = textField.leftViewMode;
    decorations.rightViewMode = textField.rightViewMode;
    decorations.clearButtonMode = textField.clearButtonMode;

    return decorations;
}

+ (void)applyDecorations:(LTUITextFieldDecorations*)decorations onView:(UITextField*)textField
{
    [super applyDecorations:decorations onView:textField];
    
    textField.text = decorations.text;
    textField.attributedText = decorations.attributedText;
    textField.textColor = decorations.textColor;
    textField.font = decorations.font;
    textField.textAlignment = decorations.textAlignment;
    textField.borderStyle = decorations.borderStyle;
    textField.defaultTextAttributes = decorations.defaultTextAttributes;
    textField.typingAttributes = decorations.typingAttributes;
    textField.clearsOnBeginEditing = decorations.clearsOnBeginEditing;
    textField.background = decorations.background;
    textField.disabledBackground = decorations.disabledBackground;
    textField.allowsEditingTextAttributes = decorations.allowsEditingTextAttributes;
    textField.leftView = decorations.leftView;
    textField.rightView = decorations.rightView;
    textField.leftViewMode = decorations.leftViewMode;
    textField.rightViewMode = decorations.rightViewMode;
    textField.clearButtonMode = decorations.clearButtonMode;
}

@end
