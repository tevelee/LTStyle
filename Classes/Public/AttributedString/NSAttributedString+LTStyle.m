//
//  NSAttributedString+LTStyle.m
//  Pods
//
//  Created by László Teveli on 2017. 05. 18..
//
//

#import "NSAttributedString+LTStyle.h"

@implementation NSString (LTStyle)

- (void)enumerateSubstrings:(NSString*)substring usingBlock:(void(^)(NSRange range))block
{
    if (block == nil)
        return;
    
    NSRange searchRange = NSMakeRange(0, self.length);
    NSRange foundRange;
    while (searchRange.location < self.length) {
        searchRange.length = self.length - searchRange.location;
        foundRange = [self rangeOfString:substring options:0 range:searchRange];
        if (foundRange.location != NSNotFound) {
            block(foundRange);
            searchRange.location = foundRange.location+foundRange.length;
        } else {
            break;
        }
    }
}

- (NSAttributedString *)attributedStringWithAttributes:(LTStringAttributes *)attributes
{
    return [NSAttributedString attributedStringWithText:self attributes:attributes];
}

@end

@implementation NSAttributedString (LTStyle)

+ (instancetype)attributedStringWithText:(NSString *)text attributes:(LTStringAttributes*)attributes
{
    return [[self alloc] initWithString:text attributes:attributes.dictionaryRepresentation];
}

- (NSAttributedString*)stringByAppendingString:(NSAttributedString*)attributedString
{
    NSMutableAttributedString* mutable = self.mutableCopy;
    [mutable appendAttributedString:attributedString];
    return mutable.copy;
}

- (NSArray<NSAttributedString*>*)componentsSeparatedByString:(NSString*)string
{
    NSArray<NSString*>* components = [self.string componentsSeparatedByString:string];
    NSRange effectiveRange = NSMakeRange(0, self.length);
    
    NSMutableArray<NSAttributedString*>* result = [NSMutableArray arrayWithCapacity:components.count];
    for (NSString* component in components) {
        NSRange range = [string rangeOfString:component options:0 range:effectiveRange];
        
        NSAttributedString* attributedComponent = [self attributedSubstringFromRange:range];
        [result addObject:attributedComponent];
        
        NSInteger diff = range.length + string.length;
        effectiveRange = NSMakeRange(effectiveRange.location + diff, effectiveRange.length - diff);
    }
    return result.copy;
}

- (NSAttributedString*)stringBySettingAttributes:(LTStringAttributes*)attributes
{
    return [[self.class alloc] initWithString:self.string attributes:attributes.dictionaryRepresentation];
}

- (NSAttributedString*)stringBySettingAttributes:(LTStringAttributes*)attributes inRange:(NSRange)range
{
    NSMutableAttributedString* mutable = self.mutableCopy;
    [mutable setAttributes:attributes.dictionaryRepresentation range:range];
    return mutable.copy;
}

- (NSAttributedString*)stringBySettingAttributes:(LTStringAttributes*)attributes onAllSubstrings:(NSString*)substring
{
    NSMutableAttributedString* mutable = self.mutableCopy;
    [self.string enumerateSubstrings:substring usingBlock:^(NSRange range) {
        [mutable setAttributes:attributes.dictionaryRepresentation range:range];
    }];
    return mutable.copy;
}

- (NSAttributedString*)stringBySettingAttributes:(LTStringAttributes*)attributes onFirstSubstring:(NSString*)substring
{
    NSMutableAttributedString* mutable = self.mutableCopy;
    NSRange range = [self.string rangeOfString:substring];
    if (range.location != NSNotFound) {
        [mutable setAttributes:attributes.dictionaryRepresentation range:range];
    }
    return mutable.copy;
}

- (NSAttributedString*)stringBySettingAttributes:(LTStringAttributes*)attributes onLastSubstring:(NSString*)substring
{
    NSMutableAttributedString* mutable = self.mutableCopy;
    NSRange range = [self.string rangeOfString:substring options:NSBackwardsSearch];
    if (range.location != NSNotFound) {
        [mutable setAttributes:attributes.dictionaryRepresentation range:range];
    }
    return mutable.copy;
}

- (NSAttributedString*)stringBySettingAttributes:(LTStringAttributes*)attributes onAllMatches:(NSString*)pattern options:(NSRegularExpressionOptions)options
{
    NSError* error = nil;
    NSRange effectiveRange = NSMakeRange(0, self.length);
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:options error:&error];
    NSArray<NSTextCheckingResult*>* matches = [regex matchesInString:self.string options:0 range:effectiveRange];
    
    NSMutableAttributedString* mutable = self.mutableCopy;
    for (NSTextCheckingResult* match in matches) {
        [mutable setAttributes:attributes.dictionaryRepresentation range:match.range];
    }
    return mutable.copy;
}

- (NSAttributedString*)stringBySettingAttributes:(LTStringAttributes*)attributes onFirstMatch:(NSString*)pattern options:(NSRegularExpressionOptions)options
{
    NSError* error = nil;
    NSRange effectiveRange = NSMakeRange(0, self.length);
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:options error:&error];
    NSRange range = [regex rangeOfFirstMatchInString:self.string options:0 range:effectiveRange];
    
    NSMutableAttributedString* mutable = self.mutableCopy;
    [mutable setAttributes:attributes.dictionaryRepresentation range:range];
    return mutable.copy;
}

- (NSAttributedString*)stringBySettingAttributes:(LTStringAttributes*)attributes onLastMatch:(NSString*)pattern options:(NSRegularExpressionOptions)options
{
    NSError* error = nil;
    NSRange effectiveRange = NSMakeRange(0, self.length);
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:options error:&error];
    NSArray<NSTextCheckingResult*>* matches = [regex matchesInString:self.string options:0 range:effectiveRange];
    NSRange range = [matches.lastObject range];
    
    NSMutableAttributedString* mutable = self.mutableCopy;
    [mutable setAttributes:attributes.dictionaryRepresentation range:range];
    return mutable.copy;
}

@end
