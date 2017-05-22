//
//  LTViewController.m
//  LTStyle
//
//  Created by tevelee on 05/18/2017.
//  Copyright (c) 2017 tevelee. All rights reserved.
//

#import "LTViewController.h"
#import <LTStyle/NSAttributedString+LTStyle.h>
#import <LTStyle/UILabel+LTDecorations.h>

@interface LTViewController ()

@property (nonatomic, strong) UILabel* label;

@end

@implementation LTViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.label = [UILabel new];
        
        LTUILabelDecorations* decor = [LTUILabelDecorations new];
        [decor setNumberOfLines:0];
        [decor setBorderWidth:1];
        [decor setBorderColor:[UIColor blackColor]];
        [decor setCornerRadius:5];
        [self.label lt_applyDecorations:decor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.view addSubview:self.label];
    [self.label setAttributedText:self.text];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self.label setFrame:CGRectInset(self.view.bounds, 20, 20)];
}

- (NSAttributedString*)text
{
    LTStringAttributes* attributes = [LTStringAttributes attributesWithFont:[UIFont boldSystemFontOfSize:14] textColor:[UIColor redColor]];
    [attributes setLineSpacing:14];
    
    NSAttributedString* example = [NSAttributedString attributedStringWithText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." attributes:attributes];
    
    LTStringAttributes* newAttributes = [LTStringAttributes attributesWithBlock:^(LTStringAttributes *attributes) {
        [attributes setBackgroundColor:[UIColor greenColor]];
    }];
    
    example = [example stringBySettingAttributes:newAttributes onAllSubstrings:@"minim"];
    return example;
}

@end
