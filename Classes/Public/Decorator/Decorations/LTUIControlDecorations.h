//
//  LTUIControlDecorations.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIViewDecorations.h"

@interface LTUIControlDecorations : LTUIViewDecorations

@property (nonatomic, assign, getter=isEnabled) BOOL enabled;
@property (nonatomic, assign, getter=isSelected) BOOL selected;
@property (nonatomic, assign, getter=isHighlighted) BOOL highlighted;
@property (nonatomic, assign) UIControlContentVerticalAlignment contentVerticalAlignment;
@property (nonatomic, assign) UIControlContentHorizontalAlignment contentHorizontalAlignment;

@end
