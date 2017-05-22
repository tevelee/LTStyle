//
//  UIControl+LTDecorations.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import <UIKit/UIKit.h>
#import "LTUIControlDecorations.h"

@interface UIControl (LTDecorations)

- (LTUIControlDecorations*)lt_decorations;
- (void)lt_applyDecorations:(LTUIControlDecorations*)decorations;

@end
