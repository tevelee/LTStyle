//
//  UIView+LTDecorations.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import <UIKit/UIKit.h>
#import "LTUIViewDecorations.h"

@interface UIView (LTDecorations)

- (LTUIViewDecorations*)lt_decorations;
- (void)lt_applyDecorations:(LTUIViewDecorations*)decorations;

@end
