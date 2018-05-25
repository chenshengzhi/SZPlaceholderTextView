//
//  SZPlaceholderTextView.m
//  SZPlaceholderTextView
//
//  Created by 陈圣治 on 16/8/9.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "SZPlaceholderTextView.h"

@interface SZPlaceholderTextView ()

@property (nonatomic, strong) UILabel *placeholderLabel;

@end

@implementation SZPlaceholderTextView

#pragma mark - Setters -
- (void)setPlaceholder:(NSString *)placeholder {
    self.placeholderLabel.text = placeholder;
    [self setNeedsLayout];
}

- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor {
    self.placeholderLabel.textColor = placeholderTextColor;
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    self.placeholderLabel.font = font;
    [self setNeedsLayout];
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    [super setTextAlignment:textAlignment];
    self.placeholderLabel.textAlignment = textAlignment;
    [self setNeedsLayout];
}

#pragma mark - Getters -
- (NSString *)placeholder {
    return self.placeholderLabel.text;
}

- (UIColor *)placeholderTextColor {
    return self.placeholderLabel.textColor;
}

#pragma mark - Setters -
- (void)setText:(NSString *)text {
    [super setText:text];
    [self textDidChange:nil];
}

#pragma mark - View Cycle -
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupForPlaceholder];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer {
    self = [super initWithFrame:frame textContainer:textContainer];
    if (self) {
        [self setupForPlaceholder];
    }
    return self;
}

- (void)setupForPlaceholder {
    self.placeholderLabel = [[UILabel alloc] init];
    self.placeholderLabel.numberOfLines = 0;
    self.placeholderLabel.font = self.font;
    self.placeholderLabel.textAlignment = self.textAlignment;
    self.placeholderLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0.1 alpha:0.22];
    [self addSubview:self.placeholderLabel];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textDidChange:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat left = self.textContainerInset.left + self.textContainer.lineFragmentPadding;
    CGFloat top = self.textContainerInset.top;
    CGFloat width = self.frame.size.width - left - self.textContainerInset.right - self.textContainer.lineFragmentPadding;
    CGSize size = [self.placeholderLabel sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)];
    self.placeholderLabel.frame = CGRectMake(left, top, width, size.height);
    
    if (!self.text.length) {
        CGFloat height = CGRectGetMaxY(self.placeholderLabel.frame) + self.textContainerInset.bottom;
        if (self.contentSize.height < height) {
            self.contentSize = CGSizeMake(CGRectGetWidth(self.bounds), height);
        }
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)textDidChange:(NSNotification *)note {
    self.placeholderLabel.alpha = self.text.length > 0 ? 0 : 1;
}

@end
