//
//  LTUIViewDecorator.h
//  Pods
//
//  Created by Daniel Nagy on 12/13/16.
//
//

#import <UIKit/UIKit.h>

@interface LTUIViewDecorator <__covariant ViewType : UIView*> : NSObject <NSCopying>

- (instancetype)initWithView:(ViewType)view;

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, assign) double alpha;
@property (nonatomic, assign) BOOL clipsToBounds;
@property (nonatomic, assign) BOOL clearsContextBeforeDrawing;
@property (nonatomic, assign, getter=isOpaque) BOOL opaque;
@property (nonatomic, assign, getter=isHidden) BOOL hidden;
@property (nonatomic, assign) UIViewContentMode contentMode;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, assign) BOOL userInteractionEnabled;

@property (nonatomic, strong) UIColor *shadowColor;
@property (nonatomic, assign) double shadowOpacity;
@property (nonatomic, assign) CGSize shadowOffset;
@property (nonatomic, assign) double shadowRadius;
- (void)setShadowColor:(UIColor *)shadowColor x:(CGFloat)x y:(CGFloat)y blur:(CGFloat)blur opacity:(CGFloat)opacity;

@property (nonatomic, assign) double cornerRadius;

@property (nonatomic, assign) double borderWidth;
@property (nonatomic, strong) UIColor *borderColor;
- (void)setBorderColor:(UIColor *)borderColor width:(CGFloat)borderWidth;

- (void)applyDecorationsOnView:(ViewType)view;

@end
