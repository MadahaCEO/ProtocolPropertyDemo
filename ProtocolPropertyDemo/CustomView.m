//
//  CustomView.m
//  ProtocolPropertyDemo
//
//  Created by Apple on 2018/9/20.
//  Copyright © 2018年 马大哈. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation CustomView

#pragma mark - Getter

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"点一下就停止";
    }
    return _titleLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor blackColor];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(touch:)]) {
        [self.delegate touch:YES];
    }
    self.titleLabel.text = self.delegate.buttonTitle;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
