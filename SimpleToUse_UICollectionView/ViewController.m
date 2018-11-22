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
    
    
    // 创建一个layout布局类
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置布局方向为 垂直布局
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    // 设置布局方向为 水平布局
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 设置每个item的大小为100*100
    layout.itemSize = CGSizeMake(100, 100);
    // 创建collectionView 通过一个布局策略layout来创建
    UICollectionView *collectView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
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
