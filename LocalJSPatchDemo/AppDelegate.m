//
//  AppDelegate.m
//  LocalJSPatchDemo
//
//  Created by liu on 2017/1/3.
//  Copyright © 2017年 lcj. All rights reserved.
//

#import "AppDelegate.h"
#import "JPEngine.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//怎么执行js代码-基本类型的转换
#if 0
    JSContext *context = [[JSContext alloc] init];
    //执行 js 代码  @"var arr = [21, 7.0, 'aaa.com'];"
    [context evaluateScript:@"var arr = [21, 7.0, 'aaa.com'];"];
    JSValue *jsArr = context[@"arr"]; // Get array from JSContext
    NSLog(@"JS Array: %@; OCArray : %@; Length: %@", jsArr,[jsArr toArray],jsArr[@"length"]);
    jsArr[1] = @"blog"; // Use JSValue as array
    jsArr[7] = @7;
    
    NSLog(@"JS Array: %@; OCArray : %@; Length: %@", jsArr,[jsArr toArray],jsArr[@"length"]);
#endif
//怎么执行js代码-方法的转换
#if 0
    JSContext *context = [[JSContext alloc] init];
    context[@"log"] = ^() {
        NSLog(@"+++++++Begin Log+++++++");
        
        NSArray *args = [JSContext currentArguments];
        
        for (JSValue *jsVal in args) {
            NSLog(@"jsVal %@", jsVal);
        }
        
        for (int i = 0; i<args.count; i++) {

            if (i == 1) {
                JSValue *twoObject = args[1];
                NSLog(@"OC twoobject = %@",[twoObject toArray]);
            }
            if (i == 2) {
                JSValue *twoObject = args[2];
                NSLog(@"OC threeobject = %@",[twoObject toDictionary]);
            }
        }
        JSValue *this = [JSContext currentThis];
        NSLog(@"this: %@",this);
        NSLog(@"-------End Log-------");
    };
    [context evaluateScript:@"log('ider', [7, 21], { hello:'world', js:100});"];
 # endif
    
//JSValue没有toBlock方法来把JavaScript方法变成Block在Objetive-C中使用，那怎么利用oc代码调用js中的block,来实现oc调用js方法
#if 0
    JSContext *context = [[JSContext alloc] init];
    [context evaluateScript:@"function add(a, b) { return a + b; }"];
    JSValue *add = context[@"add"];
    NSLog(@"Func: %@", add);
    
    JSValue *sum = [add callWithArguments:@[@(7), @(21)]];
    NSLog(@"Sum: %d",[sum toInt32]);
# endif
    
    
    [JPEngine startEngine];
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"js"];
    NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    [JPEngine evaluateScript:script];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
