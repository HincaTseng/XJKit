```
/*
 开始运行
 didFinishLaunchingWithOptions
 applicationDidBecomeActive
 
 进入后台
 applicationWillResignActive
 applicationDidEnterBackground
 
 回到前台
 applicationWillEnterForeground
 applicationDidBecomeActive
 
 杀死
 applicationDidEnterBackground
 applicationWillTerminate
 
 */
```

```
//程序载入
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions；

//进入活跃状态
- (void)applicationDidBecomeActive:(UIApplication *)application；

//进入非活跃状态
- (void)applicationWillResignActive:(UIApplication *)application；

//进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application；

//重新进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application

//杀死
- (void)applicationWillTerminate:(UIApplication *)application；
```

