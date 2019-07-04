//
//  LoginApi.m
//  YTK
//
//  Created by wang on 2019/7/4.
//  Copyright © 2019 wang. All rights reserved.
//

#import "LoginApi.h"
#import "NSString+ppstring.h"

@implementation LoginApi {
    NSDictionary *_parm;
}
-(instancetype)initWithParm:(NSDictionary *)parm type:(URLAPIType)type {
    self = [super init];
    if (self) {
        _parm = parm;
        _URLAPIType = type;
    }
    return self;
}
-(NSString *)requestUrl {
     NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    appVersion = [appVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
    switch (self.URLAPIType) {
        case URLAPITypeLogin:
           
            return  [[NSString stringWithFormat:@"v%@/public/sms",appVersion] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            break;
        case URLAPITypeHome:
            return   [[NSString stringWithFormat:@"v%@/home/select",appVersion] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

        default:
            return @"public/login";
            break;
    }
    
}
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}
-(YTKResponseSerializerType)responseSerializerType {
    return YTKResponseSerializerTypeJSON;
}
//- (YTKRequestSerializerType)requestSerializerType {
//    return YTKRequestSerializerTypeHTTP;
//}
//- (NSTimeInterval)requestTimeoutInterval {
//    return 10;
//}
-(id)requestArgument {
   
    return [self getSign:_parm];
}
-(NSInteger)cacheTimeInSeconds {
    return 0;
}

-(NSDictionary *)getSign:(NSDictionary *)parm {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict = parm.mutableCopy;
    [dict setObject:@"5" forKey:@"_source"];
    NSMutableArray *arrM = [NSMutableArray array];
    arrM = [self sortedDictionarybyLowercaseString:dict];
    NSString *sign = @"";
    for (NSString *subString in arrM) {
        sign = [sign stringByAppendingString:subString];
    }
    sign = [sign substringToIndex:sign.length - 1];
    sign = [[sign stringByAppendingString:@"dr4JG3NOFVJvgeoBEl9mOnYF"] md5];
    [dict setValue:sign forKey:@"sign"];
    return dict.copy;
}



- (NSMutableArray *)sortedDictionarybyLowercaseString:(NSDictionary *)dict{
    //将所有的key放进数组
    NSArray *allKeyArray = [dict allKeys];
    
    //序列化器对数组进行排序的block 返回值为排序后的数组
    NSArray *afterSortKeyArray = [allKeyArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id _Nonnull obj2) {
        /**
         In the compare: methods, the range argument specifies the
         subrange, rather than the whole, of the receiver to use in the
         comparison. The range is not applied to the search string.  For
         example, [@"AB" compare:@"ABC" options:0 range:NSMakeRange(0,1)]
         compares "A" to "ABC", not "A" to "A", and will return
         NSOrderedAscending. It is an error to specify a range that is
         outside of the receiver's bounds, and an exception may be raised.
         
         - (NSComparisonResult)compare:(NSString *)string;
         
         compare方法的比较原理为,依次比较当前字符串的第一个字母:
         如果不同,按照输出排序结果
         如果相同,依次比较当前字符串的下一个字母(这里是第二个)
         以此类推
         
         排序结果
         NSComparisonResult resuest = [obj1 compare:obj2];为从小到大,即升序;
         NSComparisonResult resuest = [obj2 compare:obj1];为从大到小,即降序;
         
         注意:compare方法是区分大小写的,即按照ASCII排序
         */
        //小写转化
        obj1 = [obj1 lowercaseString];
        obj2 = [obj2 lowercaseString];
        //排序操作
        NSComparisonResult resuest = [obj1 compare:obj2];
        return resuest;
    }];
    NSLog(@"afterSortKeyArray:%@",afterSortKeyArray);
    
    //通过排列的key值获取value
    //通过排列的key值获取value
    NSMutableArray *valueArray = [NSMutableArray array];
    for (NSString *sortsing in afterSortKeyArray) {
        NSString *valueString = [dict objectForKey:sortsing];
        [valueArray addObject:[NSString stringWithFormat:@"%@=%@&",sortsing,valueString]];
    }
    return valueArray;
}
@end
