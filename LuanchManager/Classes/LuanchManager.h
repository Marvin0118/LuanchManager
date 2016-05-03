//
//  LuanchManager.h
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//  启动事件管理，一次性的<MODULE_WEB_SERVICE>

#import <Foundation/Foundation.h>

#ifndef MODULE_LUANCH_MANAGER
#define MODULE_LUANCH_MANAGER
#endif

typedef void (^LuanchCompleteBlock)(void);


@interface LuanchManager : NSObject

+ (instancetype)shareInstance;

/// 启动完成时掉用，即rootViewController在viewDidAppear的时候掉用
+ (void)launchComplete;

/// 注册app启动才能掉用的方法，如果app早已启动则直接执行block。block只会执行一次
+ (void)registerLaunchAction:(LuanchCompleteBlock)block;

@end
