//
//  SZPlaceholderTextView.h
//  SZPlaceholderTextView
//
//  Created by 陈圣治 on 16/8/9.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface SZPlaceholderTextView : UITextView

@property (copy, nonatomic) IBInspectable NSString *placeholder;
@property (retain, nonatomic) IBInspectable UIColor *placeholderTextColor;

@end
