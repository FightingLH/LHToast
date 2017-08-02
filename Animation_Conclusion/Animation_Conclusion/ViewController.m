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
#import "CATranstionViewController.h"
#import "ImageViewController.h"
#import "CGAffineViewController.h"
#import "ShufflingViewController.h"
#import "AnimationGroupController.h"
#import "MotionDesignController.h"
#import "OneImageViewController.h"

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
    @try {
        [self reloadTableView];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)reloadTableView
{
    // 将列表变为不可见，重载数据
    self.tableView.alpha = 0.0f;
    [self.tableView reloadData];
    // 存储一个时间变量，这样我就可以调整每行动画之间的延迟时间
    CGFloat diff = .05;
    CGFloat tableHeight = self.tableView.bounds.size.height;
    NSArray *cells = [self.tableView visibleCells];
    // 遍历行并将它们移动到屏幕底部
    for (NSUInteger a = 0; a < [cells count]; a++) {
        UITableViewCell *cell = [cells objectAtIndex:a];
        if ([cell isKindOfClass:[UITableViewCell class]]) {
            // 通过变换cell的Y坐标来讲其移动到屏幕底部
//            cell.transform = CGAffineTransformMakeTranslation(cell.bounds.size.width, 0);
             cell.transform = CGAffineTransformRotate(cell.transform, -M_PI/2);
        }
    }
    // 现在所有的行都在屏幕底部了，将列表设为可见
    self.tableView.alpha = 1.0f;
    // 将每行动画回位置
    for (NSUInteger b = 0; b < [cells count]; b++) {
        UITableViewCell *cell = [cells objectAtIndex:b];
        
        [UIView animateWithDuration:1.6 delay:diff*b usingSpringWithDamping:0.77
              initialSpringVelocity:0 options:0 animations:^{
                  cell.transform = CGAffineTransformMakeTranslation(0, 0);
              } completion:NULL];
    }
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
            case 2:
        {
            CATranstionViewController *tra = [[CATranstionViewController alloc]init];
            [self.navigationController pushViewController:tra animated:YES];
        }
            break;
            case 3:
        {
            ImageViewController *im = [[ImageViewController alloc]init];
            [self.navigationController pushViewController:im animated:YES];
        }
            break;
            case 4:
        {
            CGAffineViewController *cg = [[CGAffineViewController alloc]init];
            [self.navigationController pushViewController:cg animated:YES];
        }
            break;
            case 5:
        {
            ShufflingViewController *shufflign = [[ShufflingViewController alloc]init];
            [self.navigationController pushViewController:shufflign animated:YES];
        }break;
            case 6:
        {
            AnimationGroupController
            *group = [[AnimationGroupController alloc]init];
            [self.navigationController pushViewController:group animated:YES];
        }break;
            case 7:
        {
            MotionDesignController *motion = [[MotionDesignController alloc]init];
            [self.navigationController pushViewController:motion animated:YES];
        }break;
            case 8:
        {
            OneImageViewController *one = [[OneImageViewController alloc]init];
            [self.navigationController pushViewController:one animated:YES];
        }break;
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
