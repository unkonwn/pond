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
    //todo 传递商品的ID
    [self.navigationController pushViewController:detailCon animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    SJGoodCell *cell = [SJGoodCell goodCellWithTableView:tableView];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    //在设置高度的回调中获取当前indexpath的cell 然后返回给他的frame的高度即可。在创建cell的时候记得最后把cell.frame.size.height 等于你内容的高。

    SJGoodCell *cell = (SJGoodCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.cellHeight;
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
