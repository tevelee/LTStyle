//
//  UIButton+LTDecorations.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import <UIKit/UIKit.h>
#import "LTUIButtonDecorations.h"

@interface UIButton (LTDecorations)

- (LTUIButtonDecorations*)lt_decorations;
- (void)lt_applyDecorations:(LTUIButtonDecorations*)decorations;

@end
