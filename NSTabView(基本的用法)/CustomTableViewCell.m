//
//  CustomTableViewCell.m
//  NSTabView(基本的用法)
//
//  Created by 范云飞 on 2017/6/23.
//  Copyright © 2017年 范云飞. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView{
    [super drawWithFrame:cellFrame inView:controlView];
    self.imageView = [[NSImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
    [self.imageView setImage:[NSImage imageNamed:@"111"]];
    [controlView addSubview:self.imageView ];
    
    self.text = [[NSText alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.imageView.frame)+10, CGRectGetMinY(self.imageView.frame), 100, 20)];
    self.text.string = @"你大爷的";
    [controlView addSubview:self.text];
    
//    NSButtonCell * cell = [[NSButtonCell alloc]initTextCell:@"fadf"];
//    [controlView addSubview:cell];
}

@end
