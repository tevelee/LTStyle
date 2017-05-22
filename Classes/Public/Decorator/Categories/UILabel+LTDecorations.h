//
//  UILabel+LTDecorations.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import <UIKit/UIKit.h>
#import "LTUILabelDecorations.h"

@interface UILabel (LTDecorations)

- (LTUILabelDecorations*)lt_decorations;
- (void)lt_applyDecorations:(LTUILabelDecorations*)decorations;

@end
