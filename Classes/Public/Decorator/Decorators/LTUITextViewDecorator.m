//
//  LTUITextViewDecorator.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUITextViewDecorator.h"

@implementation LTUITextViewDecorator

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.textAlignment = NSTextAlignmentLeft;
    }
    return self;
}

- (instancetype)initWithView:(UITextView *)textView
{
    self = [super initWithView:textView];
    if (self)
    {
        self.text = textView.text;
        self.attributedText = textView.attributedText;
        self.textColor = textView.textColor;
        self.font = textView.font;
        self.textAlignment = textView.textAlignment;
        self.selectedRange = textView.selectedRange;
        self.editable = textView.editable;
        self.selectable = textView.selectable;
        self.dataDetectorTypes = textView.dataDetectorTypes;
        self.allowsEditingTextAttributes = textView.allowsEditingTextAttributes;
        self.typingAttributes = textView.typingAttributes;
        self.inputView = textView.inputView;
        self.inputAccessoryView = textView.inputAccessoryView;
        self.clearsOnInsertion = textView.clearsOnInsertion;
        self.textContainerInset = textView.textContainerInset;
        self.linkTextAttributes = textView.linkTextAttributes;
    }
    return self;
}

- (void)applyDecorationsOnView:(UITextView *)textView
{
    [super applyDecorationsOnView:textView];

    textView.text = self.text;
    textView.attributedText = self.attributedText;
    textView.textColor = self.textColor;
    textView.font = self.font;
    textView.textAlignment = self.textAlignment;
    textView.selectedRange = self.selectedRange;
    textView.editable = self.editable;
    textView.selectable = self.selectable;
    textView.dataDetectorTypes = self.dataDetectorTypes;
    textView.allowsEditingTextAttributes = self.allowsEditingTextAttributes;
    textView.typingAttributes = self.typingAttributes;
    textView.inputView = self.inputView;
    textView.inputAccessoryView = self.inputAccessoryView;
    textView.clearsOnInsertion = self.clearsOnInsertion;
    textView.textContainerInset = self.textContainerInset;
    textView.linkTextAttributes = self.linkTextAttributes;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    LTUITextViewDecorator *copy = [super copyWithZone:zone];

    copy.text = self.text;
    copy.attributedText = self.attributedText;
    copy.textColor = self.textColor.copy;
    copy.font = self.font.copy;
    copy.textAlignment = self.textAlignment;
    copy.selectedRange = self.selectedRange;
    copy.editable = self.editable;
    copy.selectable = self.selectable;
    copy.dataDetectorTypes = self.dataDetectorTypes;
    copy.allowsEditingTextAttributes = self.allowsEditingTextAttributes;
    copy.typingAttributes = self.typingAttributes.copy;
    copy.inputView = self.inputView;
    copy.inputAccessoryView = self.inputAccessoryView;
    copy.clearsOnInsertion = self.clearsOnInsertion;
    copy.textContainerInset = self.textContainerInset;
    copy.linkTextAttributes = self.linkTextAttributes.copy;

    return copy;
}

@end
