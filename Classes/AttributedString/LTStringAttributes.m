#import "LTStringAttributes.h"

static NSString* const kLTStyleAttributesKey = @"kLTStyleAttributesKey";

@interface LTStringAttributes ()

@property (nonatomic, strong) NSMutableDictionary *attributes;

@end

@implementation LTStringAttributes

+ (instancetype)attributesFromDictionary:(NSDictionary*)dictionary
{
    return [[LTStringAttributes alloc] initWithDictionary:dictionary];
}

- (instancetype)initWithDictionary:(NSDictionary*)dictionary
{
    self = [self init];
    if (self) {
        _attributes = dictionary.mutableCopy;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _attributes = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSDictionary*)dictionaryRepresentation
{
    return _attributes.copy;
}

+ (instancetype)attributesWithFont:(Font*)font textColor:(Color *)color
{
    return [self attributesWithBlock:^(LTStringAttributes *attributes) {
        [attributes setFont:font];
        [attributes setTextColor:color];
    }];
}

+ (instancetype)attributesWithBlock:(void(^)(LTStringAttributes* attributes))block
{
    return [[self new] apply:block];
}

- (instancetype)apply:(void(^)(LTStringAttributes* attributes))block
{
    if (block)
        block(self);
    
    return self;
}

- (instancetype)merge:(LTStringAttributes *)attributes
{
    NSMutableDictionary* newAttributesDictionary = self.attributes.mutableCopy;
    [newAttributesDictionary addEntriesFromDictionary:attributes.dictionaryRepresentation];
    
    return [self initWithDictionary:newAttributesDictionary];
}

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        _attributes = [coder decodeObjectForKey:kLTStyleAttributesKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:_attributes forKey:kLTStyleAttributesKey];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    return [[self.class allocWithZone:zone] initWithDictionary:_attributes];
}

#pragma mark - Attributes

#pragma mark Font

- (Font*)font
{
    return _attributes[NSFontAttributeName];
}

- (void)setFont:(Font*)font
{
    _attributes[NSFontAttributeName] = font;
}

#pragma mark TextColor

- (Color*)textColor
{
    return _attributes[NSForegroundColorAttributeName];
}

- (void)setTextColor:(Color*)textColor
{
    _attributes[NSForegroundColorAttributeName] = textColor;
}

#pragma mark BackgroundColor

- (Color*)backgroundColor
{
    return _attributes[NSBackgroundColorAttributeName];
}

- (void)setBackgroundColor:(Color*)backgroundColor
{
    _attributes[NSBackgroundColorAttributeName] = backgroundColor;
}

#pragma mark Ligatures

- (BOOL)ligatures
{
    return [_attributes[NSLigatureAttributeName] boolValue];
}

- (void)setLigatures:(BOOL)ligatures
{
    _attributes[NSLigatureAttributeName] = @(ligatures);
}

#pragma mark Kern

- (CGFloat)kern
{
    return [_attributes[NSKernAttributeName] floatValue];
}

- (void)setKern:(CGFloat)kern
{
    _attributes[NSKernAttributeName] = @(kern);
}

#pragma mark Strikethrough

- (BOOL)strikethrough
{
    return [_attributes[NSStrikethroughStyleAttributeName] boolValue];
}

- (void)setStrikethrough:(BOOL)strikethrough
{
    _attributes[NSStrikethroughStyleAttributeName] = @(strikethrough);
}

#pragma mark StrikethroughColor

- (Color*)strikethroughColor
{
    return _attributes[NSStrikethroughColorAttributeName];
}

- (void)setStrikethroughColor:(Color*)strikethroughColor
{
    _attributes[NSStrikethroughColorAttributeName] = strikethroughColor;
}

#pragma mark Underline

- (BOOL)underline
{
    return [_attributes[NSUnderlineStyleAttributeName] boolValue];
}

- (void)setUnderline:(BOOL)underline
{
    _attributes[NSUnderlineStyleAttributeName] = @(underline);
}

#pragma mark UnderlineColor

- (Color*)underlineColor
{
    return _attributes[NSUnderlineColorAttributeName];
}

- (void)setUnderlineColor:(Color*)underlineColor
{
    _attributes[NSUnderlineColorAttributeName] = underlineColor;
}

#pragma mark StrokeColor

- (Color*)strokeColor
{
    return _attributes[NSStrokeColorAttributeName];
}

- (void)setStrokeColor:(Color*)strokeColor
{
    _attributes[NSStrokeColorAttributeName] = strokeColor;
}

#pragma mark StrokeWidth

- (CGFloat)strokeWidth
{
    return [_attributes[NSStrokeWidthAttributeName] floatValue];
}

- (void)setStrokeWidth:(CGFloat)strokeWidth
{
    _attributes[NSStrokeWidthAttributeName] = @(strokeWidth);
}

#pragma mark TextAttachment

- (NSTextAttachment *)textAttachment
{
    return _attributes[NSAttachmentAttributeName];
}

- (void)setTextAttachment:(NSTextAttachment *)textAttachment
{
    _attributes[NSAttachmentAttributeName] = textAttachment;
}

#pragma mark Link

- (NSURL *)link
{
    return _attributes[NSLinkAttributeName];
}

- (void)setLink:(NSURL *)link
{
    _attributes[NSLinkAttributeName] = link;
}

#pragma mark BaselineOffset

- (CGFloat)baselineOffset
{
    return [_attributes[NSBaselineOffsetAttributeName] floatValue];
}

- (void)setBaselineOffset:(CGFloat)baselineOffset
{
    _attributes[NSBaselineOffsetAttributeName] = @(baselineOffset);
}

#pragma mark Obliqueness

- (CGFloat)obliqueness
{
    return [_attributes[NSObliquenessAttributeName] floatValue];
}

- (void)setObliqueness:(CGFloat)obliqueness
{
    _attributes[NSObliquenessAttributeName] = @(obliqueness);
}

#pragma mark Expansion

- (CGFloat)expansion
{
    return [_attributes[NSExpansionAttributeName] floatValue];
}

- (void)setExpansion:(CGFloat)expansion
{
    _attributes[NSExpansionAttributeName] = @(expansion);
}

#pragma mark VerticalGlyphForm

- (BOOL)verticalGlyphForm
{
    return [_attributes[NSVerticalGlyphFormAttributeName] boolValue];
}

- (void)setVerticalGlyphForm:(BOOL)verticalGlyphForm
{
    _attributes[NSVerticalGlyphFormAttributeName] = @(verticalGlyphForm);
}

#pragma mark OutlineColor

- (Color *)outlineColor
{
    return _attributes[NSStrokeColorAttributeName];
}

- (void)setOutlineColor:(Color*)outlineColorNew
{
    _attributes[NSStrokeColorAttributeName] = outlineColorNew;
}

#pragma mark OutlineWidth

- (CGFloat)outlineWidth
{
    return [_attributes[NSStrokeWidthAttributeName] floatValue];
}

- (void)setOutlineWidth:(CGFloat)outlineWidthNew
{
    _attributes[NSStrokeWidthAttributeName] = @(outlineWidthNew);
}

#pragma mark ParagraphStyle

- (NSParagraphStyle *)paragraphStyle
{
    return _attributes[NSParagraphStyleAttributeName];
}

- (void)setParagraphStyle:(NSParagraphStyle *)paragraphStyle
{
    _attributes[NSParagraphStyleAttributeName] = paragraphStyle;
}

#pragma mark LineSpacing

- (CGFloat)lineSpacing
{
    return self.paragraphStyle.lineSpacing;
}

- (void)setLineSpacing:(CGFloat)lineSpacing
{
    [self applyParagraphStyle:^(NSMutableParagraphStyle *paragraphStyle) {
        [paragraphStyle setLineSpacing:lineSpacing];
    }];
}

#pragma mark ParagraphSpacing

- (CGFloat)paragraphSpacing
{
    return self.paragraphStyle.paragraphSpacing;
}

- (void)setParagraphSpacing:(CGFloat)paragraphSpacing
{
    [self applyParagraphStyle:^(NSMutableParagraphStyle *paragraphStyle) {
        [paragraphStyle setParagraphSpacing:paragraphSpacing];
    }];
}

#pragma mark Alignment

- (NSTextAlignment)alignment
{
    return self.paragraphStyle.alignment;
}

- (void)setAlignment:(NSTextAlignment)alignment
{
    [self applyParagraphStyle:^(NSMutableParagraphStyle *paragraphStyle) {
        [paragraphStyle setAlignment:alignment];
    }];
}

#pragma mark FirstLineHeadIndent

- (CGFloat)firstLineHeadIndent
{
    return self.paragraphStyle.firstLineHeadIndent;
}

- (void)setFirstLineHeadIndent:(CGFloat)firstLineHeadIndent
{
    [self applyParagraphStyle:^(NSMutableParagraphStyle *paragraphStyle) {
        [paragraphStyle setFirstLineHeadIndent:firstLineHeadIndent];
    }];
}

#pragma mark HeadIndent

- (CGFloat)headIndent
{
    return self.paragraphStyle.headIndent;
}

- (void)setHeadIndent:(CGFloat)headIndent
{
    [self applyParagraphStyle:^(NSMutableParagraphStyle *paragraphStyle) {
        [paragraphStyle setHeadIndent:headIndent];
    }];
}

#pragma mark TailIndent

- (CGFloat)tailIndent
{
    return self.paragraphStyle.tailIndent;
}

- (void)setTailIndent:(CGFloat)tailIndent
{
    [self applyParagraphStyle:^(NSMutableParagraphStyle *paragraphStyle) {
        [paragraphStyle setTailIndent:tailIndent];
    }];
}

#pragma mark LineBreakMode

- (NSLineBreakMode)lineBreakMode
{
    return self.paragraphStyle.lineBreakMode;
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
    [self applyParagraphStyle:^(NSMutableParagraphStyle *paragraphStyle) {
        [paragraphStyle setLineBreakMode:lineBreakMode];
    }];
}

#pragma mark MinimumLineHeight

- (CGFloat)minimumLineHeight
{
    return self.paragraphStyle.minimumLineHeight;
}

- (void)setMinimumLineHeight:(CGFloat)minimumLineHeight
{
    [self applyParagraphStyle:^(NSMutableParagraphStyle *paragraphStyle) {
        [paragraphStyle setMinimumLineHeight:minimumLineHeight];
    }];
}

#pragma mark MaximumLineHeight

- (CGFloat)maximumLineHeight
{
    return self.paragraphStyle.maximumLineHeight;
}

- (void)setMaximumLineHeight:(CGFloat)maximumLineHeight
{
    [self applyParagraphStyle:^(NSMutableParagraphStyle *paragraphStyle) {
        [paragraphStyle setMaximumLineHeight:maximumLineHeight];
    }];
}

#pragma mark BaseWritingDirection

- (NSWritingDirection)baseWritingDirection
{
    return self.paragraphStyle.baseWritingDirection;
}

- (void)setBaseWritingDirection:(NSWritingDirection)baseWritingDirection
{
    [self applyParagraphStyle:^(NSMutableParagraphStyle *paragraphStyle) {
        [paragraphStyle setBaseWritingDirection:baseWritingDirection];
    }];
}

#pragma mark LineHeightMultiple

- (CGFloat)lineHeightMultiple
{
    return self.paragraphStyle.lineHeightMultiple;
}

- (void)setLineHeightMultiple:(CGFloat)lineHeightMultiple
{
    [self applyParagraphStyle:^(NSMutableParagraphStyle *paragraphStyle) {
        [paragraphStyle setLineHeightMultiple:lineHeightMultiple];
    }];
}

#pragma mark ParagraphSpacingBefore

- (CGFloat)paragraphSpacingBefore
{
    return self.paragraphStyle.paragraphSpacingBefore;
}

- (void)setParagraphSpacingBefore:(CGFloat)paragraphSpacingBefore
{
    [self applyParagraphStyle:^(NSMutableParagraphStyle *paragraphStyle) {
        [paragraphStyle setParagraphSpacingBefore:paragraphSpacingBefore];
    }];
}

#pragma mark HyphenationFactor

- (float)hyphenationFactor
{
    return self.paragraphStyle.hyphenationFactor;
}

- (void)setHyphenationFactor:(float)hyphenationFactor
{
    [self applyParagraphStyle:^(NSMutableParagraphStyle *paragraphStyle) {
        [paragraphStyle setHyphenationFactor:hyphenationFactor];
    }];
}

#pragma mark TabStops

- (NSArray<NSTextTab *> *)tabStops
{
    return self.paragraphStyle.tabStops;
}

- (void)setTabStops:(NSArray<NSTextTab *> *)tabStops
{
    [self applyParagraphStyle:^(NSMutableParagraphStyle *paragraphStyle) {
        [paragraphStyle setTabStops:tabStops];
    }];
}

#pragma mark DefaultTabInterval

- (CGFloat)defaultTabInterval
{
    return self.paragraphStyle.defaultTabInterval;
}

- (void)setDefaultTabInterval:(CGFloat)defaultTabInterval
{
    [self applyParagraphStyle:^(NSMutableParagraphStyle *paragraphStyle) {
        [paragraphStyle setDefaultTabInterval:defaultTabInterval];
    }];
}

#pragma mark AllowsDefaultTighteningForTruncation

- (BOOL)allowsDefaultTighteningForTruncation
{
    return self.paragraphStyle.allowsDefaultTighteningForTruncation;
}

- (void)setAllowsDefaultTighteningForTruncation:(BOOL)allowsDefaultTighteningForTruncation
{
    [self applyParagraphStyle:^(NSMutableParagraphStyle *paragraphStyle) {
        [paragraphStyle setAllowsDefaultTighteningForTruncation:allowsDefaultTighteningForTruncation];
    }];
}

#pragma mark Shadow

- (void)setShadow:(NSShadow *)shadow
{
    _shadow = shadow;
    _attributes[NSShadowAttributeName] = shadow;
}

#pragma mark ShadowColor

- (void)setShadowColor:(Color *)shadowColor
{
    _shadowColor = shadowColor;
    
    [self applyShadow:^(NSShadow *shadow) {
        [shadow setShadowColor:shadowColor];
    }];
}

#pragma mark ShadowOffset

- (void)setShadowOffset:(CGSize)shadowOffset
{
    _shadowOffset = shadowOffset;
    
    [self applyShadow:^(NSShadow *shadow) {
        [shadow setShadowOffset:shadowOffset];
    }];
}

#pragma mark ShadowBlurRadius

- (void)setShadowBlurRadius:(CGFloat)shadowBlurRadius
{
    _shadowBlurRadius = shadowBlurRadius;
    
    [self applyShadow:^(NSShadow *shadow) {
        [shadow setShadowBlurRadius:shadowBlurRadius];
    }];
}

#pragma mark - Custom

- (void)setCustomAttribute:(id)attribute forKey:(NSString*)key
{
    _attributes[key] = attribute;
}

- (id)customAttributeForKey:(NSString*)key
{
    return _attributes[key];
}

#pragma mark - Helpers

- (void)applyShadow:(void(^)(NSShadow* shadow))block
{
    NSShadow* shadow = _shadow ?: [NSShadow new];
    block(shadow);
    _attributes[NSShadowAttributeName] = shadow;
}

- (void)applyParagraphStyle:(void(^)(NSMutableParagraphStyle* paragraphStyle))block
{
    NSParagraphStyle* paragraphStyle = self.paragraphStyle ?: [NSParagraphStyle defaultParagraphStyle];
    NSMutableParagraphStyle* mutableParagraphStyle = paragraphStyle.mutableCopy;
    block(mutableParagraphStyle);
    _attributes[NSParagraphStyleAttributeName] = mutableParagraphStyle.copy;
}

@end
