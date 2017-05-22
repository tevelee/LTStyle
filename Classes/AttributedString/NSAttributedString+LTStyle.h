//
//  NSAttributedString+LTStyle.h
//  Pods
//
//  Created by László Teveli on 2017. 05. 18..
//
//

#import <Foundation/Foundation.h>
#import "LTStringAttributes.h"

//TODO: NSRange from-to

@interface NSString (LTStyle)

- (NSAttributedString*)attributedStringWithAttributes:(LTStringAttributes*)attributes;

@end

@interface NSAttributedString (LTStyle)

+ (instancetype)attributedStringWithText:(NSString *)text attributes:(LTStringAttributes*)attributes;

- (NSAttributedString*)stringByAppendingString:(NSAttributedString*)attributedString;
- (NSArray<NSAttributedString*>*)componentsSeparatedByString:(NSString*)string;

- (NSAttributedString*)stringBySettingAttributes:(LTStringAttributes*)attributes;
- (NSAttributedString*)stringBySettingAttributes:(LTStringAttributes*)attributes inRange:(NSRange)range;

- (NSAttributedString*)stringBySettingAttributes:(LTStringAttributes*)attributes onAllSubstrings:(NSString*)substring;
- (NSAttributedString*)stringBySettingAttributes:(LTStringAttributes*)attributes onFirstSubstring:(NSString*)substring;
- (NSAttributedString*)stringBySettingAttributes:(LTStringAttributes*)attributes onLastSubstring:(NSString*)substring;

- (NSAttributedString*)stringBySettingAttributes:(LTStringAttributes*)attributes onAllMatches:(NSString*)regex options:(NSRegularExpressionOptions)options;
- (NSAttributedString*)stringBySettingAttributes:(LTStringAttributes*)attributes onFirstMatch:(NSString*)regex options:(NSRegularExpressionOptions)options;
- (NSAttributedString*)stringBySettingAttributes:(LTStringAttributes*)attributes onLastMatch:(NSString*)regex options:(NSRegularExpressionOptions)options;

@end
