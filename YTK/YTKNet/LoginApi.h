//
//  LoginApi.h
//  YTK
//
//  Created by wang on 2019/7/4.
//  Copyright © 2019 wang. All rights reserved.
//

#import "YTKRequest.h"
#import <YTKNetwork.h>
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,URLAPIType) {
    URLAPITypeLogin,
    URLAPITypeHome,
};

@interface LoginApi : YTKRequest
-(instancetype)initWithParm:(NSDictionary *)parm type:(URLAPIType)type;
@property(nonatomic,assign) URLAPIType URLAPIType;

@end

NS_ASSUME_NONNULL_END
