//
//  LuanchManager.m
//  Common
//
//  Created by 黄磊 on 16/4/6.
//  Copyright © 2016年 Musjoy. All rights reserved.
//

#import "LuanchManager.h"

static LuanchManager *s_luanchManager = nil;
static BOOL g_appHadLaunch = NO;                        /**< 应用程序是否已启动 */


@interface LuanchManager ()

@property (nonatomic, strong) NSMutableArray *arrLaunchBlock;

@end

@implementation LuanchManager


+ (instancetype)shareInstance
{
    static dispatch_once_t once_patch;
    dispatch_once(&once_patch, ^() {
        s_luanchManager = [[self alloc] init];
    });
    return s_luanchManager;
}

- (id)init
{
    self  = [super init];
    if (self) {
        // 这里启动一个定时器，防止忘记调用launchComplete，导致依赖于该类的方法无法执行
        [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(launchComplete) userInfo:nil repeats:NO];
    }
    return self;
}

#pragma mark - Get & Set

- (NSMutableArray *)arrLaunchBlock
{
    if (_arrLaunchBlock == nil) {
        _arrLaunchBlock = [[NSMutableArray alloc] init];
    }
    return _arrLaunchBlock;
}

#pragma mark - Public

+ (void)launchComplete
{
    [[self shareInstance] launchComplete];
}

+ (void)registerLaunchAction:(LuanchCompleteBlock)block
{
    [[self shareInstance] registerLaunchAction:block];
}

#pragma mark - Private

- (void)launchComplete
{
    if (g_appHadLaunch) {
        return;
    }
    g_appHadLaunch = YES;
    for (LuanchCompleteBlock block in self.arrLaunchBlock) {
        block();
    }
    [self.arrLaunchBlock removeAllObjects];
}

- (void)registerLaunchAction:(LuanchCompleteBlock)block
{
    if (block == NULL) {
        return;
    }
    if (g_appHadLaunch) {
        block();
        return;
    }
    [self.arrLaunchBlock addObject:block];
}

@end
