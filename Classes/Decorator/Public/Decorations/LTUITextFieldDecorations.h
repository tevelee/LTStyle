//
//  LTUITextFieldDecorations.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIControlDecorations.h"

@interface LTUITextFieldDecorations : LTUIControlDecorations

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSAttributedString *attributedText;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, assign) UITextBorderStyle borderStyle;
@property (nonatomic, strong) NSDictionary<NSString *, id> *defaultTextAttributes;
@property (nonatomic, strong) NSDictionary<NSString *, id> *typingAttributes;
@property (nonatomic, assign) BOOL clearsOnBeginEditing;
@property (nonatomic, strong) UIImage *background;
@property (nonatomic, strong) UIImage *disabledBackground;
@property (nonatomic, assign) BOOL allowsEditingTextAttributes;

@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *rightView;
@property (nonatomic, assign) UITextFieldViewMode leftViewMode;
@property (nonatomic, assign) UITextFieldViewMode rightViewMode;
@property (nonatomic, assign) UITextFieldViewMode clearButtonMode;

@end
