//
//  LTUIControlDecorator.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIViewDecorator.h"

@interface LTUIControlDecorator <__covariant ControlType: UIControl*> : LTUIViewDecorator<ControlType> <NSCopying>

@property (nonatomic, assign, getter=isEnabled) BOOL enabled;
@property (nonatomic, assign, getter=isSelected) BOOL selected;
@property (nonatomic, assign, getter=isHighlighted) BOOL highlighted;
@property (nonatomic, assign) UIControlContentVerticalAlignment contentVerticalAlignment;
@property (nonatomic, assign) UIControlContentHorizontalAlignment contentHorizontalAlignment;

@end
