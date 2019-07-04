//
//  YTKUrlArgumentsFilter.h
//  YTK
//
//  Created by wang on 2019/7/4.
//  Copyright © 2019 wang. All rights reserved.
//
/// 给url追加arguments，用于全局参数，比如AppVersion, ApiVersion等
#import <Foundation/Foundation.h>
#import <YTKNetwork.h>

NS_ASSUME_NONNULL_BEGIN

@interface YTKUrlArgumentsFilter : NSObject<YTKUrlFilterProtocol>
//添加k公共参数
+ (YTKUrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments;
- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request;
@end

NS_ASSUME_NONNULL_END
