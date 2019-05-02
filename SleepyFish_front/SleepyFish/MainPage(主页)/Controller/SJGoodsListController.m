//
//  SJGoodsListController.m
//  SleepyFish
//
//  Created by sj on 2019/3/12.
//  Copyright © 2019年 sj. All rights reserved.
//

#import "SJGoodsListController.h"
#import "SJGoodCell.h"
#import "SJGoodDetailViewCon.h"

static NSString * const goodCellId = @"good";

@interface SJGoodsListController ()

@end

@implementation SJGoodsListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [NetworkTool Post:@"https://www.taobao.com" parameters:nil graceTime:NetworkRequestGraceTimeTypeAlways isHTTPRequestSerializer:YES isHTTPResponseSerializer:YES success:^(NSDictionary *response, AFHTTPRequestOperation *operation) {
//        NSLog(@"成功");
//    } failure:^(NSError *error, AFHTTPRequestOperation *operation) {
//        NSLog(@"%@",error);
//    }];
    
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SJGoodCell class]) bundle:nil] forCellReuseIdentifier:goodCellId];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1;
}

#pragma 选择每个商品时调到商品详情页

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SJGoodDetailViewCon *detailCon = [[SJGoodDetailViewCon alloc] init];
    [self.navigationController pushViewController:detailCon animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SJGoodCell *cell = [tableView dequeueReusableCellWithIdentifier:goodCellId];
    #warning 设置模型数据
//    NSLog(@"%@",cell);
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
