//
//  CustomView.h
//  ProtocolPropertyDemo
//
//  Created by Apple on 2018/9/20.
//  Copyright © 2018年 马大哈. All rights reserved.
//



#import <UIKit/UIKit.h>


@protocol MDHTouchDelegate <NSObject>

@required
@property(nonatomic, copy, readonly) NSString *buttonTitle;


@optional
- (void)touch:(BOOL)isTest;

@end



@interface CustomView : UIView

@property (nonatomic, weak) id <MDHTouchDelegate> delegate;
@end
