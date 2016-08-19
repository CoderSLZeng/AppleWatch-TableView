//
//  ShowCell.m
//  TableView的使用
//
//  Created by Anthony on 16/8/19.
//  Copyright © 2016年 SLZeng. All rights reserved.
//

#import "ShowCell.h"
#import <WatchKit/WatchKit.h>

@interface ShowCell ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *image;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *label;

@end

@implementation ShowCell
- (void)setImageName:(NSString *)imageName title:(NSString *)title
{
    [self.image setImageNamed:imageName];
    [self.label setText:title];
}
@end
