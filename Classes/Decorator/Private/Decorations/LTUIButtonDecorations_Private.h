//
//  LTUIButtonDecorations_Private.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 22..
//
//

#import "LTUIButtonDecorations.h"

@interface LTUIButtonDecorations (Private)

@property (nonatomic, strong) NSMutableDictionary<NSNumber*, UIColor*>* backgroundColorsForStates;
@property (nonatomic, strong) NSMutableDictionary<NSNumber*, UIImage*>* backgroundImagesForStates;
@property (nonatomic, strong) NSMutableDictionary<NSNumber*, UIImage*>* imagesForStates;
@property (nonatomic, strong) NSMutableDictionary<NSNumber*, NSString*>* titlesForStates;
@property (nonatomic, strong) NSMutableDictionary<NSNumber*, UIColor*>* titleColorsForStates;

+ (void)forAllStates:(void (^)(UIControlState))block;

@end
