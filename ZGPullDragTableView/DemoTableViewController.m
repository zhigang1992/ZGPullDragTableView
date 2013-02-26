//
//  DemoTableViewController.m
//  ZGPullDragTableView
//
//  Created by Kyle Fang on 2/26/13.
//  Copyright (c) 2013 Kyle Fang. All rights reserved.
//

#import "DemoTableViewController.h"

#import "UITableView+ZGPullDrag.h"

@interface DemoTableViewController () <ZGPullViewDelegate, ZGDragViewDelegate>

@end

@implementation DemoTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *pullView = [[UIView alloc] initWithFrame:CGRectMake(-320, 0, 320, 80)];
    pullView.backgroundColor = [UIColor greenColor];
    pullView.alpha = 0;
    [self.tableView addZGPullView:pullView];
    self.tableView.ZGPullViewDelegate = self;
    
    UIView *dragView = [[UIView alloc] initWithFrame:CGRectMake(320, 0, 320, 80)];
    dragView.backgroundColor = [UIColor greenColor];
    dragView.alpha = 0;
    [self.tableView addZGDragView:dragView];
    self.tableView.ZGDragViewDelegate = self;
}

- (void)pullView:(UIView *)pullView Show:(CGFloat)shownPixels ofTotal:(CGFloat)totalPixels{
    CGFloat progress = MIN(shownPixels / totalPixels, 1.f);
    pullView.alpha = progress;
    CGRect frame = pullView.frame;
    frame.origin.x = -320+320*progress;
    pullView.frame = frame;
}

- (void)pullView:(UIView *)pullView hangForCompletionBlock:(void (^)())completed{
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        completed();
    });
}

- (void)dragView:(UIView *)dragView Show:(CGFloat)showPixels ofTotal:(CGFloat)totalPixels{
    CGFloat progress = MIN(showPixels/totalPixels, 1.f);
    dragView.alpha = progress;
    CGRect frame = dragView.frame;
    frame.origin.x = 320-320*progress;
    dragView.frame = frame;
}

- (void)dragView:(UIView *)dragView hangForCompletionBlock:(void (^)())completed{
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        completed();
    });
}

@end
