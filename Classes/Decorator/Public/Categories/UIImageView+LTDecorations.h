//
//  UIImageView+LTDecorations.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import <UIKit/UIKit.h>
#import "LTUIImageViewDecorations.h"

@interface UIImageView (LTDecorations)

- (LTUIImageViewDecorations*)lt_decorations;
- (void)lt_applyDecorations:(LTUIImageViewDecorations*)decorations;

@end
