//
//  LTUITextViewDecorator.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUITextViewDecorator.h"
#import "LTUIViewDecorator_Private.h"

@implementation LTUITextViewDecorator

+ (LTUITextViewDecorations*)decorationsFromView:(UITextView*)textView
{
    LTUITextViewDecorations* decorations = [LTUITextViewDecorations new];
    
    decorations.text = textView.text;
    decorations.attributedText = textView.attributedText;
    decorations.textColor = textView.textColor;
    decorations.font = textView.font;
    decorations.textAlignment = textView.textAlignment;
    decorations.selectedRange = textView.selectedRange;
    decorations.editable = textView.editable;
    decorations.selectable = textView.selectable;
    decorations.dataDetectorTypes = textView.dataDetectorTypes;
    decorations.allowsEditingTextAttributes = textView.allowsEditingTextAttributes;
    decorations.typingAttributes = textView.typingAttributes;
    decorations.inputView = textView.inputView;
    decorations.inputAccessoryView = textView.inputAccessoryView;
    decorations.clearsOnInsertion = textView.clearsOnInsertion;
    decorations.textContainerInset = textView.textContainerInset;
    decorations.linkTextAttributes = textView.linkTextAttributes;
    
    return decorations;
}

+ (void)applyDecorations:(LTUITextViewDecorations*)decorations onView:(UITextView*)textView
{
    [super applyDecorations:decorations onView:textView];
    
    textView.text = decorations.text;
    textView.attributedText = decorations.attributedText;
    textView.textColor = decorations.textColor;
    textView.font = decorations.font;
    textView.textAlignment = decorations.textAlignment;
    textView.selectedRange = decorations.selectedRange;
    textView.editable = decorations.editable;
    textView.selectable = decorations.selectable;
    textView.dataDetectorTypes = decorations.dataDetectorTypes;
    textView.allowsEditingTextAttributes = decorations.allowsEditingTextAttributes;
    textView.typingAttributes = decorations.typingAttributes;
    textView.inputView = decorations.inputView;
    textView.inputAccessoryView = decorations.inputAccessoryView;
    textView.clearsOnInsertion = decorations.clearsOnInsertion;
    textView.textContainerInset = decorations.textContainerInset;
    textView.linkTextAttributes = decorations.linkTextAttributes;
}

@end
