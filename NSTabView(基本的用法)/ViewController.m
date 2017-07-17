//
//  ViewController.m
//  NSTabView(基本的用法)
//
//  Created by 范云飞 on 2017/6/23.
//  Copyright © 2017年 范云飞. All rights reserved.
//

#import "ViewController.h"
//cell
#import "CustomTableViewCell.h"

//View
#import "CustomView.h"

static NSString * indentify = @"CustomTableViewCell";

@interface ViewController ()<NSTableViewDelegate,NSTableViewDataSource>
@property (strong, nonatomic) NSScrollView * tableViewContent;
@property (strong, nonatomic) NSTableView * tableView;
@property (strong, nonatomic) NSMutableArray <NSString *>* dataSource;
@property (strong, nonatomic) NSTableColumn * tableColumn;


@end

@implementation ViewController

#pragma mark - Life
- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowDidResize:) name:NSWindowDidResizeNotification object:self];
    [self initUI];
}
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

- (void)windowDidResize:(NSNotification *)aNotification {
    // 调整NSWindow上NSView的frame
    
}

#pragma mark - init
- (void)initUI{
    [self.view addSubview:self.tableViewContent];
    [self.view addSubview:self.tableView];
    [self.tableView addTableColumn:self.tableColumn];
    [self.tableViewContent setDocumentView:self.tableView];
    [self.tableViewContent setHasVerticalScroller:YES];
    [self.tableViewContent setHasHorizontalScroller:YES];
    
    self.dataSource = [NSMutableArray arrayWithObjects:@"ffasdff",@"fasdf",@"fadsfasdfa",@"fasdfasdfasdfasd",@"fasdfasdfasdfadf", nil];
    [self.tableView reloadData];
}

#pragma mark - setter

- (NSScrollView *)tableViewContent{
    if (!_tableViewContent) {
        _tableViewContent = [[NSScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height)];
    }
    return _tableViewContent;
}

- (NSTableColumn *)tableColumn{
    if (!_tableColumn) {
        _tableColumn = [[NSTableColumn alloc]initWithIdentifier:@"cell"];
        _tableColumn.width = self.view.frame.size.width;
        _tableColumn.title = @"标题";
//        [_tableColumn setDataCell:[[CustomTableViewCell alloc]init]];
    }
    return _tableColumn;
}

- (NSTableView *)tableView{
    if (!_tableView) {
        _tableView = [[NSTableView alloc]initWithFrame:self.view.frame];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}

#pragma mark - NSTableViewDelegate&&NSTableViewDataSourceDelegate
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return self.dataSource.count;
}

    //返回NSView类型的时候调用

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSString * Id = [tableColumn identifier];

    CustomView * view = [tableView makeViewWithIdentifier:Id owner:self];
    if (!view) {
        view = [[CustomView alloc]initWithFrame:CGRectMake(0, 0, tableColumn.width, 50)];
        view.content = [self.dataSource objectAtIndex:row];
    }
    
    return view;
}
   // 返回NSCell类型的时候调用
//
//- (NSCell *)tableView:(NSTableView *)tableView dataCellForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
//    NSString * Id = [tableColumn identifier];
//    NSCell *cell;
//    if ([Id isEqualToString:@"cell"]&&!cell) {
//        cell = [[CustomTableViewCell alloc]init];
//    }
//    return cell;
//}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    return nil;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row{
    return 50;
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row{
    
    NSLog(@"***********%ld*********",(long)row);
    return YES;
}

@end
