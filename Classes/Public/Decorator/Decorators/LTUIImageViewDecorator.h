//
//  LTUIImageViewDecorator.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIViewDecorator.h"

@interface LTUIImageViewDecorator : LTUIViewDecorator<UIImageView*> <NSCopying>

@property (nonatomic, strong) UIImage *image;

@end
