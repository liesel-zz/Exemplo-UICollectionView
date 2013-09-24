//
//  MOBCollectionViewController.m
//  CollectionvIEW
//
//  Created by Joel Backschat on 9/22/13.
//  Copyright (c) 2013 Joel Backschat. All rights reserved.
//

#import "MOBCollectionViewController.h"
#import "MOBCollectionViewCell.h"
@interface MOBCollectionViewController ()

@end

@implementation MOBCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadCategorias];
	// Do any additional setup after loading the view.
}


-(void)loadCategorias{
    NSString *urlString = @"http://www.cafecomjava.com.br/collectionView/categorias.php";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation   =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
    NSDictionary *categorias       = (NSDictionary *)JSON;
    self.resultados = categorias[@"categoria"];
    [self.collection reloadData];
    }
    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                                                                     message:[NSString stringWithFormat:@"%@",error] delegate:nil                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                        [av show];
                                                    }];
    [operation start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.resultados count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MOBCollectionViewCell *cel = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *categoria = [self.resultados objectAtIndex:indexPath.row];
    cel.lblLabel.text = categoria[@"nome"];
    NSString *stringUrl = [NSString stringWithFormat:@"http://www.cafecomjava.com.br/collectionView/icones_categorias/%@", categoria[@"imagem"]];
    NSURL *urlImagem = [NSURL URLWithString:stringUrl];
    [cel.imgCell setImageWithURL:urlImagem];
    cel.layer.cornerRadius= 5;
    [cel.layer setBackgroundColor:[[UIColor colorWithRed:0.584 green:0.024 blue:0.224 alpha:1]CGColor]];
    return cel;
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    // TODO: Deselect item
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    // TODO: Select item
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(89.5, 90.0);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0.5, 0.5, 0.5, 0.5);
}

@end
