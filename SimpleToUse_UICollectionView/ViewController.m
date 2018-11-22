//
//  ViewController.m
//  SimpleToUse_UICollectionView
//
//  Created by Geraint on 2018/11/22.
//  Copyright © 2018 kilolumen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /**
     
        1.必须要有布局,在初始化的时候就需要. (-init{})
        2.必须注册cell(分为代码和Xib)
        3.UICollectionView的cell是由布局决定
        4.自定义cell
        // 系统自带了流水布局,专门做九宫格
        // UICollectionViewLayout基类,UICollectionViewFlowLayout是布局对象
     
     */
    
    // 创建一个layout布局类
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置布局方向为 垂直布局
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    // 设置布局方向为 水平布局
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 设置每个item的大小为100*100
    layout.itemSize = CGSizeMake(100, 100);
    // 头部尺寸
    layout.headerReferenceSize = CGSizeMake(50, 50);
    // 尾部尺寸
    layout.footerReferenceSize = CGSizeMake(50, 50);
    // 设置 垂直间距
    layout.minimumLineSpacing = 40;
    // 设置 水平间距
//    layout.minimumInteritemSpacing = 50;
    // 设置分区的头视图和尾视图是否始终固定在屏幕上边和下边
    layout.sectionHeadersPinToVisibleBounds = YES;
    layout.sectionFootersPinToVisibleBounds = YES;
    
    // 创建collectionView 通过一个布局策略layout来创建
    UICollectionView *collectView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    // 设置 背景颜色
    collectView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    // 设置代理
    collectView.delegate = self;
    collectView.dataSource = self;
    // 注册item类型，这里使用系统的类型 (在完成代理回调前，必须注册一个cell)
    [collectView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    
    [self.view addSubview:collectView];
    
    
    
}

#pragma mark -- 必须在ViewController类中为Collection View实现这两个代理方法：
// 返回分区个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
// 返回每个分区的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

// 在UICollectionView的回调代理中，只能使用从复用池中获取cell的方式进行cell的返回，其他方式则崩溃😖
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 255/255.0 green:arc4random() % 255/255.0 blue:arc4random() % 255/255.0 alpha:1];
    return cell;
    
}


@end
