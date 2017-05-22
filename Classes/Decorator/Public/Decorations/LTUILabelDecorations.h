//
//  LTUILabelDecorations.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIViewDecorations.h"

@interface LTUILabelDecorations : LTUIViewDecorations

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSAttributedString *attributedText;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) NSLineBreakMode lineBreakMode;
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, assign) NSInteger numberOfLines;

@end
