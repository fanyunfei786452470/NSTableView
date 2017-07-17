//
//  CustomView.m
//  NSTabView(基本的用法)
//
//  Created by 范云飞 on 2017/6/23.
//  Copyright © 2017年 范云飞. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
- (instancetype)initWithFrame:(NSRect)frameRect{
    self = [super initWithFrame:frameRect];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    self.imageView = [[NSImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
    [self.imageView setImage:[NSImage imageNamed:@"111"]];
    [self addSubview:self.imageView ];
    
    self.text = [[NSTextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.imageView.frame)+10, CGRectGetMinY(self.imageView.frame), 100, 20)];
    self.text.bordered = NO;
    self.text.font = [NSFont systemFontOfSize:10];
    self.text.editable = NO;
    self.text.backgroundColor = [NSColor clearColor];
    [self addSubview:self.text];
    
}
- (void)setContent:(NSString *)content{
    self.text.stringValue = content;
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
