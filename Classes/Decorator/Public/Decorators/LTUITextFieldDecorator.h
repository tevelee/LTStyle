//
//  LTUITextFieldDecorator.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIControlDecorator.h"
#import "LTUITextFieldDecorations.h"

@interface LTUITextFieldDecorator : LTUIControlDecorator<UITextField*, LTUITextFieldDecorations*> <NSCopying>

@end
