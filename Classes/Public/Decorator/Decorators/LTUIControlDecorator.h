//
//  LTUIControlDecorator.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIViewDecorator.h"
#import "LTUIControlDecorations.h"

@interface LTUIControlDecorator <__covariant ControlType : UIControl*, __covariant DecorationsType : LTUIControlDecorations*> : LTUIViewDecorator<ControlType, DecorationsType>

@end
