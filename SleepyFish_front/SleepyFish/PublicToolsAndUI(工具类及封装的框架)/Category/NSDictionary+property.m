//
//  NSDictionary+property.m
//  KVC演练
//
//  Created by sj on 2019/3/9.
//  Copyright © 2019年 sj. All rights reserved.
//

#import "NSDictionary+property.h"

@implementation NSDictionary (property)

- (void)createProperty{
    NSMutableString *properties = [NSMutableString string];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        NSLog(@"%@",[obj class]);
       
        NSString *singleProperty;
        if([obj isKindOfClass:[NSDictionary class]])
          singleProperty = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",key];
        else if([obj isKindOfClass:[NSArray class]])
            singleProperty = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",key];
        else if([obj isKindOfClass:[NSString class]])
            singleProperty = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;",key];
        else if([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")])
            singleProperty = [NSString stringWithFormat:@"@property (nonatomic, assign) NSArray *%@;",key];
        else if([obj isKindOfClass:[NSNumber class]])
            singleProperty = [NSString stringWithFormat:@"@property (nonatomic, assign) NSNumber *%@;",key];
        [properties appendFormat:@"\n%@\n",singleProperty];
     
    }];
    NSLog(@"%@",properties);
}

@end
