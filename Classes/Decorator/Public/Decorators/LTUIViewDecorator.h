//
//  LTUIViewDecorator.h
//  Pods
//
//  Created by Daniel Nagy on 12/13/16.
//
//

#import <UIKit/UIKit.h>
#import "LTUIViewDecorations.h"

@interface LTUIViewDecorator <__covariant ViewType : UIView*,
                              __covariant DecorationsType : LTUIViewDecorations*> : NSObject <NSCopying>

@property (nonatomic, copy) DecorationsType decorations;

- (instancetype)initWithDecorations:(DecorationsType)decorations NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithView:(ViewType)view;

- (void)applyDecorationsOnView:(ViewType)view;

@end
