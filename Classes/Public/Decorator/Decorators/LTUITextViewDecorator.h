//
//  LTUITextViewDecorator.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIViewDecorator.h"

@interface LTUITextViewDecorator : LTUIViewDecorator<UITextView*> <NSCopying>

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSAttributedString *attributedText;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, assign) NSRange selectedRange;
@property (nonatomic, assign, getter=isEditable) BOOL editable;
@property (nonatomic, assign, getter=isSelectable) BOOL selectable;
@property (nonatomic, assign) UIDataDetectorTypes dataDetectorTypes;
@property (nonatomic, assign) BOOL allowsEditingTextAttributes;
@property (nonatomic, strong) NSDictionary<NSString *, id> *typingAttributes;
@property (nonatomic, strong) UIView *inputView;
@property (nonatomic, strong) UIView *inputAccessoryView;
@property (nonatomic, assign) BOOL clearsOnInsertion;
@property (nonatomic, assign) UIEdgeInsets textContainerInset;
@property (nonatomic, strong) NSDictionary<NSString *, id> *linkTextAttributes;

@end
