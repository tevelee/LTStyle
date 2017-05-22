//
//  LTUIViewDecoratorInternal.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIViewDecorator.h"

@interface LTUIViewDecorator <__covariant ViewType : UIView*, __covariant DecorationsType : LTUIViewDecorations*> (Private)

+ (DecorationsType)decorationsFromView:(ViewType)view;
+ (void)applyDecorations:(DecorationsType)decorations onView:(ViewType)view;

@end
