//
//  ViewController.m
//  ProtocolPropertyDemo
//
//  Created by Apple on 2018/9/20.
//  Copyright © 2018年 马大哈. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController () <MDHTouchDelegate>
{
    NSTimer *timer;
}
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ViewController

@synthesize buttonTitle;


#pragma mark - Protocol
- (NSString *)buttonTitle {
    
    return self.titleLabel.text;
}

- (void)touch:(BOOL)isTest {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"alert" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
}



#pragma mark - Getter

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 50)];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"0";
    }
    return _titleLabel;
}



- (void)updateTitle {
    
    NSInteger temp = [self.titleLabel.text integerValue];
    temp+=1;
    
    self.titleLabel.text = [NSString stringWithFormat:@"%ld",temp];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CustomView *view = [[CustomView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * 9/16)];
    view.delegate = self;
    [self.view addSubview:view];
    
    
    [self.view addSubview:self.titleLabel];
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateTitle) userInfo:nil repeats:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
