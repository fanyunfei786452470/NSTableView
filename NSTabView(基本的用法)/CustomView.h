//
//  CustomView.h
//  NSTabView(基本的用法)
//
//  Created by 范云飞 on 2017/6/23.
//  Copyright © 2017年 范云飞. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CustomView : NSView
@property (strong, nonatomic) NSImageView * imageView;
@property (copy, nonatomic) NSString * content;
@property (strong, nonatomic) NSTextField * text;
- (instancetype)initWithFrame:(NSRect)frameRect;
@end
