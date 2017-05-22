//
//  UITextField+LTDecorations.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import <UIKit/UIKit.h>
#import "LTUITextFieldDecorations.h"

@interface UITextField (LTDecorations)

- (LTUITextFieldDecorations*)lt_decorations;
- (void)lt_applyDecorations:(LTUITextFieldDecorations*)decorations;

@end
