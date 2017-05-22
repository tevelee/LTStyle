//
//  LTUITextViewDecorations.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUITextViewDecorations.h"

@implementation LTUITextViewDecorations

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.textAlignment = NSTextAlignmentLeft;
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    LTUITextViewDecorations *copy = [super copyWithZone:zone];
    
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
