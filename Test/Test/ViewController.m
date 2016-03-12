//
//  ViewController.m
//  Test
//
//  Created by Mac on 16/1/23.
//  Copyright © 2016年 crc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) NSMutableArray *array;

@property (nonatomic,strong) UIImageView *leftImageView;

@property (nonatomic,strong) UIImageView *rightImageView;

@property (nonatomic,assign) int index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    _index = 1;
    _scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];

    [self.view addSubview:_scrollView];
    
    _scrollView.contentSize = CGSizeMake(2*self.view.frame.size.width, self.view.frame.size.height);
    
    _array = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 3; i ++) {
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"bg%d.jpg",i]];
        
        [_array addObject:image];
        
    }
    
    _leftImageView = [[UIImageView alloc]initWithImage:_array[0]];
    
    _leftImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    _rightImageView = [[UIImageView alloc]initWithImage:_array[1]];
    
    _rightImageView.frame = CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [_scrollView addSubview:_leftImageView];
    
    [_scrollView addSubview:_rightImageView];
    
    _scrollView.pagingEnabled = YES;
    
    _scrollView.delegate = self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    
    if (_scrollView.contentOffset.x > self.view.frame.size.width) {
        
        _index ++;
        
        _scrollView.contentOffset = CGPointZero;
        
        _leftImageView.image = _rightImageView.image;
        
        _rightImageView.image = _array[_index%_array.count];

        return;
    }
    
    if (_scrollView.contentOffset.x < 0) {
        
        _index --;
        
        _scrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
        
        _rightImageView.image = _leftImageView.image;
        
        if (_index < 0) {
            _index += _array.count;
        }
        NSLog(@"%d",_index);
        
        _leftImageView.image = _array[_index%_array.count];
        
        return;
    }
    
    if (_scrollView.contentOffset.x/self.view.frame.size.width == 0) {
        
        _index ++;

        
    }
    
    if (_scrollView.contentOffset.x/self.view.frame.size.height == 1) {
        
        _index --;
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
