#if TARGET_OS_IPHONE
typedef UIFont Font;
typedef UIColor Color;
#else
typedef NSFont Font;
typedef NSColor Color;
#endif

@interface LTStringAttributes : NSObject <NSCopying, NSCoding>

+ (instancetype)attributesFromDictionary:(NSDictionary*)dictionary;
- (NSDictionary<NSString*,id>*)dictionaryRepresentation;

+ (instancetype)attributesWithFont:(Font*)font textColor:(Color*)color;
+ (instancetype)attributesWithBlock:(void(^)(LTStringAttributes* attributes))block;

- (instancetype)apply:(void(^)(LTStringAttributes* attributes))block;
- (instancetype)merge:(LTStringAttributes*)attributes;

@property (nonatomic, strong) Font* font;

@property (nonatomic, strong) Color* textColor;
@property (nonatomic, strong) Color* backgroundColor;

@property (nonatomic, assign) BOOL ligatures;
@property (nonatomic, assign) CGFloat kern;

@property (nonatomic, assign) BOOL strikethrough;
@property (nonatomic, strong) Color* strikethroughColor;

@property (nonatomic, assign) BOOL underline;
@property (nonatomic, strong) Color* underlineColor;

@property (nonatomic, strong) Color* strokeColor;
@property (nonatomic, assign) CGFloat strokeWidth;

@property (nonatomic, strong) NSTextAttachment* textAttachment;
@property (nonatomic, strong) NSURL* link;
@property (nonatomic, assign) CGFloat baselineOffset;
@property (nonatomic, assign) CGFloat obliqueness;
@property (nonatomic, assign) CGFloat expansion;
@property (nonatomic, assign) BOOL verticalGlyphForm;

@property (nonatomic, strong) NSParagraphStyle* paragraphStyle;
@property (nonatomic, assign) CGFloat lineSpacing;
@property (nonatomic, assign) CGFloat paragraphSpacing;
@property (nonatomic, assign) NSTextAlignment alignment;
@property (nonatomic, assign) CGFloat firstLineHeadIndent;
@property (nonatomic, assign) CGFloat headIndent;
@property (nonatomic, assign) CGFloat tailIndent;
@property (nonatomic, assign) NSLineBreakMode lineBreakMode;
@property (nonatomic, assign) CGFloat minimumLineHeight;
@property (nonatomic, assign) CGFloat maximumLineHeight;
@property (nonatomic, assign) NSWritingDirection baseWritingDirection;
@property (nonatomic, assign) CGFloat lineHeightMultiple;
@property (nonatomic, assign) CGFloat paragraphSpacingBefore;
@property (nonatomic, assign) float hyphenationFactor;
@property (nonatomic, strong) NSArray<NSTextTab*>* tabStops;
@property (nonatomic, assign) CGFloat defaultTabInterval;
@property (nonatomic, assign) BOOL allowsDefaultTighteningForTruncation NS_AVAILABLE(10_11, 9_0);

@property (nonatomic, strong) NSShadow* shadow;
@property (nonatomic, assign) CGFloat shadowBlurRadius;
@property (nonatomic, strong) Color* shadowColor;
@property (nonatomic, assign) CGSize shadowOffset;

@property (nonatomic, strong) Color* outlineColor;
@property (nonatomic, assign) CGFloat outlineWidth;

- (void)setCustomAttribute:(id)attribute forKey:(NSString*)key;
- (id)customAttributeForKey:(NSString*)key;

@end
