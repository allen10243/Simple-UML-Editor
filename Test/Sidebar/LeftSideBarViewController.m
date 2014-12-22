//
//  LeftNavViewController.m
//  SideBarNavDemo
//
//  Created by JianYe on 12-12-11.
//  Copyright (c) 2012年 JianYe. All rights reserved.
//

#import "LeftSideBarViewController.h"
#import "SideBarSelectedDelegate.h"

#import "TouchView.h"

@interface LeftSideBarViewController ()
{
    NSArray *_dataList;
    NSArray *_imageList;
    int _selectIdnex;
}
@end

@implementation LeftSideBarViewController

@synthesize mainTableView,delegate;


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
    _dataList = @[@"Select",@"Association line",@"Generalization line",@"Composition line",@"class",@"use case"];
    _imageList = @[@"selection.png",@"line.png",@"line2.png",@"line3.png",@"class.png",@"usecase.png"];
    if ([delegate respondsToSelector:@selector(leftSideBarSelectWithController:)]) {
        [delegate leftSideBarSelectWithController:[self subConWithIndex:0]];
        _selectIdnex = 0;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    cell.textLabel.text = [_dataList objectAtIndex:indexPath.row];
    cell.imageView.contentMode = UIViewContentModeScaleToFill;
    cell.imageView.image = [UIImage imageNamed:[_imageList objectAtIndex:indexPath.row]];
    cell.textLabel.numberOfLines = 2;

    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([delegate respondsToSelector:@selector(leftSideBarSelectWithController:)]) {
        
       /* if (indexPath.row == _selectIdnex) {
            [delegate leftSideBarSelectWithController:nil];
        }else
        {
            [delegate leftSideBarSelectWithController:[self subConWithIndex:indexPath.row]];
        }*/
        
        [delegate leftSideBarSelectWithController:nil];

    }
    [_mainController setSelectRow:indexPath.row];
    
    _selectIdnex = indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

- (UINavigationController *)subConWithIndex:(int)index
{
    //CustomViewController *con = [[CustomViewController alloc] init];
    //con.index = index+1;
    //UINavigationController *nav= [[UINavigationController alloc] initWithRootViewController:con];
    
    
    _mainController = [[CustomViewController alloc] init];
    _mainController.index = index + 1;
    
    UINavigationController *nav= [[UINavigationController alloc] initWithRootViewController:_mainController];
    nav.navigationBar.hidden = YES;
    
    NSLog(@"%d",index);

    return nav ;
}

@end
