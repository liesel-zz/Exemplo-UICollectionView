//
//  MOBCollectionViewController.h
//  CollectionvIEW
//
//  Created by Joel Backschat on 9/22/13.
//  Copyright (c) 2013 Joel Backschat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFJSONRequestOperation.h>
#import <UIImageView+AFNetworking.h>

@interface MOBCollectionViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (nonatomic,strong) NSMutableArray *resultados;
@end
