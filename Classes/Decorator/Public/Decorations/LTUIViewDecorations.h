//
//  LTUIViewDecorations.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import <UIKit/UIKit.h>

@interface LTUIViewDecorations : NSObject <NSCopying>

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

@end
