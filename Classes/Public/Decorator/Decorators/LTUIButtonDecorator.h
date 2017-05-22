//
//  LTUIButtonDecorator.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIControlDecorator.h"

@interface LTUIButtonDecorator : LTUIControlDecorator<UIButton*> <NSCopying>

@property (nonatomic, strong) UIFont *font;

@property (nonatomic, strong) UIColor *titleColorForAllStates;
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;

@property (nonatomic, strong) UIImage *imageForAllStates;
- (void)setImage:(UIImage *)image forState:(UIControlState)state;

@property (nonatomic, strong) NSString *titleForAllStates;
- (void)setTitle:(NSString *)title forState:(UIControlState)state;

@property (nonatomic, strong) UIImage *backgroundImageForAllStates;
- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state;

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

@property (nonatomic, assign) UIEdgeInsets contentEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets titleEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets imageEdgeInsets;

@end
