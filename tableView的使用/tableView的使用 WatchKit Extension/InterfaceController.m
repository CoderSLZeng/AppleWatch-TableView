//
//  InterfaceController.m
//  TableView的使用 WatchKit Extension
//
//  Created by Anthony on 16/8/19.
//  Copyright © 2016年 SLZeng. All rights reserved.
//

#import "InterfaceController.h"
#import "ShowCell.h"

@interface InterfaceController()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *tableView;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    [self.tableView setNumberOfRows:5 withRowType:@"row1"];
    
    for (NSUInteger i = 0; i < 5; i++) {
        
        // 获取第i行的row
        ShowCell *cell = [self.tableView rowControllerAtIndex:i];
        // 赋值
        [cell setImageName:[NSString stringWithFormat:@"ad_0%d", i] title:[NSString stringWithFormat:@"第%d个", i + 1]];
    }
}

/**
 *  点击了某行tableView
 */
- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    ShowCell *cell = [self.tableView rowControllerAtIndex:rowIndex];
    NSLog(@"%s", __func__);
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

/**
 *  添加一行
 */
- (IBAction)addRow {
    
    // 获取tableView的最后一行
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:self.tableView.numberOfRows];
    
    // 插入一行
    [self.tableView insertRowsAtIndexes:indexSet withRowType:@"row1"];
    // 滚到哪一行
    [self.tableView scrollToRowAtIndex:0];
}


/**
 *  删除一行
 */
- (IBAction)deleteRow {

    // 获取tableView的最后一行
    NSIndexSet *lastIndexSet = [NSIndexSet indexSetWithIndex:self.tableView.numberOfRows - 1];
    // 删除最后一行
    [self.tableView removeRowsAtIndexes:lastIndexSet];
}

@end



