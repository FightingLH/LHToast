//
//  ViewController.m
//  Animation_Conclusion
//
//  Created by lh on 2017/7/18.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "ViewController.h"
#import "CircleViewController.h"
#import "TransitionsViewController.h"
#import "CustomPushAnimation.h"

@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property  (nonatomic, strong)  CustomPushAnimation *customPush;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = [NSMutableArray new];
    for (int i = 0; i<20; i++) {
        [self.dataArray addObject:[NSString stringWithFormat:@"第%d个动画效果",i]];
    }
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"test"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.dataArray[indexPath.row]];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            CircleViewController *circle = [[CircleViewController alloc]init];
            [self.navigationController pushViewController:circle animated:YES];
        }
            break;
        case 1:
        {
            self.navigationController.delegate = self;
            self.customPush = [[CustomPushAnimation alloc]init];
            TransitionsViewController *trans = [[TransitionsViewController alloc]init];
            [self.navigationController pushViewController:trans animated:YES];
        }
            break;
        default:
            break;
    }
}
- (id<UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC

{
    //push的时候用我们自己定义的customPush
    if (operation == UINavigationControllerOperationPush) {
        return self.customPush;
    }else{
        return nil;
    }
}

@end
