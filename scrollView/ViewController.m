//
//  ViewController.m
//  scrollView
//
//  Created by trung bao on 05/12/2015.
//  Copyright © 2015 baotrung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@end

@implementation ViewController {
    UIScrollView *scrollview;
    UIImageView *images;
    UINavigationBar *bar;
    UILabel *label;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height - 50)];
    images = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"images"]];
    bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0,0, self.view.bounds.size.width, 50)];
    bar.barStyle = UIBarStyleDefault;
    bar.backgroundColor = [UIColor whiteColor];
    UINavigationItem *baritem = [[UINavigationItem alloc] initWithTitle:@"Giá trị Scare"];
    bar.items = [NSArray arrayWithObject:baritem];
    label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 60 , 15, 60, 35)];
    [scrollview addSubview:images];
    [bar addSubview:label];
    scrollview.delegate = self;
    scrollview.minimumZoomScale = 0.2;
    scrollview.maximumZoomScale = 3.0;
    [self.view addSubview:scrollview];
    [self.view addSubview:bar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return images;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    label.text = [NSString stringWithFormat:@"%2.2f",scrollView.zoomScale];
}
@end
