//
//  UITableView+ZGPullDrag.h
//  ZGPullDragTableView
//
//  Created by Kyle Fang on 2/26/13.
//  Copyright (c) 2013 Kyle Fang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZGDragViewDelegate <NSObject>
@optional
- (void)dragView:(UIView *)dragView Show:(CGFloat )showPixels ofTotal:(CGFloat )totalPixels;
- (void)dragView:(UIView *)dragView hangForCompletionBlock:(void (^)())completed;
@end

@protocol ZGPullViewDelegate <NSObject>
@optional
- (void)pullView:(UIView *)pullView Show:(CGFloat )shownPixels ofTotal:(CGFloat )totalPixels;
- (void)pullView:(UIView *)pullView hangForCompletionBlock:(void (^)())completed;
@end

@interface UITableView (ZGPullDrag)

- (void)addZGPullView:(UIView *)pullView;
- (void)addZGDragView:(UIView *)dragView;
@property (nonatomic) id <ZGPullViewDelegate> ZGPullViewDelegate;
@property (nonatomic) id <ZGDragViewDelegate> ZGDragViewDelegate;

@end
