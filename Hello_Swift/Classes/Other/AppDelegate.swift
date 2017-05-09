//
//  AppDelegate.swift
//  Hello_Swift
//
//  Created by cw on 17/2/27.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit
//ShareSDK
let ShareKey = "1c067074663d4"
let ShareSecret = "ac15eba84a3fba1269bc90a27f727dba"
//微信
let WXAppID = "wxcdf48bdbdd0c4c6f"
let WXAppSecret = "299ca35405233f0775c58c0634faec16"
//新浪
let SinaAppKey = "1720522258"
let SinaAppSecret = "8d4f2f58891bbf8f5c142c86a25914eb"
//QQ
let QQAppID = "1104744025"
let QQAppKey = "GdiLLicEWLWQWEaI"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = BaseTabBarController()
        //ShareSDK
        ShareSDK.registerApp(ShareKey, activePlatforms: [
            SSDKPlatformType.typeSinaWeibo.rawValue,SSDKPlatformType.subTypeWechatTimeline.rawValue,SSDKPlatformType.subTypeQZone.rawValue,SSDKPlatformType.typeQQ.rawValue,SSDKPlatformType.typeWechat.rawValue,SSDKPlatformType.subTypeQQFriend.rawValue,SSDKPlatformType.subTypeWechatSession.rawValue],onImport: { (platformType) in
                switch platformType{
                case SSDKPlatformType.typeSinaWeibo:
                    ShareSDKConnector.connectWeibo(WeiboSDK.classForCoder())
                case SSDKPlatformType.typeWechat:
                    ShareSDKConnector.connectWeChat(WXApi.classForCoder())
                case SSDKPlatformType.typeQQ:
                    ShareSDKConnector.connectQQ(QQApiInterface.classForCoder(), tencentOAuthClass: TencentOAuth.classForCoder())
                default:
                    break
                }
        }) { (platformType, appInfo) in
            switch platformType{
              case SSDKPlatformType.typeSinaWeibo:
                appInfo?.ssdkSetupSinaWeibo(byAppKey: SinaAppKey, appSecret: SinaAppSecret, redirectUri: "http://www.sharesdk.cn", authType: SSDKAuthTypeBoth)
            case SSDKPlatformType.typeWechat:
                appInfo?.ssdkSetupWeChat(byAppId: WXAppID, appSecret: WXAppSecret)
            case SSDKPlatformType.typeQQ:
                appInfo?.ssdkSetupQQ(byAppId: QQAppID, appKey: QQAppKey, authType:SSDKAuthTypeBoth)
            default:
                break
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

