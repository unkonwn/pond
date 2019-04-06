//
//  NSObject+Model.m
//  KVC演练
//
//  Created by sj on 2019/3/15.
//  Copyright © 2019年 sj. All rights reserved.
//

#import "NSObject+Model.h"
#import <objc/message.h>

//获取属性值，但是可能会漏掉直接定义的成员变量
//class_getProperty(<#Class  _Nullable __unsafe_unretained cls#>, <#const char * _Nonnull name#>)
@implementation NSObject (Model)

+(instancetype)modelWithDict:(NSDictionary *)dict{
    id objc = [[self alloc] init];
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self, &count); //获取成员变量列表
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        
        //从形如_property的字符串中截取property
        NSString *key = [ivarName substringFromIndex:1];
        id value = dict[key];
        
        //二级转化，模型中的字典转化为模型,判断一级模型中的属性是不是字典类型且用户是不是使用了自定义类型
        if ([value isKindOfClass:[NSDictionary class]] && ![ivarType hasPrefix:@"NS"]) {
            //二级的字典转模型
            Class modelClass = NSClassFromString(ivarType);
            value = [modelClass modelWithDict:value];
        }
        if(value)
            //通过KVC来设置对象的属性，不需要担心模型中属性少于字典的情况
            [objc setValue:value forKey:key];
    }
    
    return objc;
    
}

@end
