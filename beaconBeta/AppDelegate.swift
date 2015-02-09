//
//  AppDelegate.swift
//  beaconBeta
//
//  Created by jay on 15/2/2.
//  Copyright (c) 2015年 doudoujay. All rights reserved.
//

//
//  AppDelegate.swift
//  beaconBeta
//
//  Created by jay on 15/2/2.
//  Copyright (c) 2015年 doudoujay. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ESTBeaconManagerDelegate{
    
    var window: UIWindow?
    var LManeger = ESTBeaconManager()
    var beaconUUID = NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")
    var identifierString = "Estimotes"
    var region: ESTBeaconRegion!
    var BeaconData:[ESTBeacon]!
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //Init AVOS
        //        AVOSCloud.setApplicationId("ljjj607s88efliqeer0wqy595y433ycfoxu96huwe70kxdkq", clientKey: "oi3gtl53bwqe9b115zpgukl9uxwkvu45r03vltx1kzj13vhj")
        //        AVAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        LManeger.delegate = self
        if(CLLocationManager.authorizationStatus() != CLAuthorizationStatus.Authorized){
            LManeger.requestWhenInUseAuthorization()
        }
        
        region = ESTBeaconRegion(proximityUUID: beaconUUID, identifier: identifierString)
        LManeger.startRangingBeaconsInRegion(self.region)
        LManeger.startMonitoringForRegion(self.region)
        self.beaconManager(LManeger, didStartMonitoringForRegion: self.region)
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    func beaconManager(manager: ESTBeaconManager!, didStartMonitoringForRegion region: ESTBeaconRegion!) {
        self.LManeger.startRangingBeaconsInRegion(self.region)
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    func beaconManager(manager: ESTBeaconManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: ESTBeaconRegion!) {
        BeaconData = beacons as? [ESTBeacon]
        
    }
    func GetBeaconData() -> [ESTBeacon] {
        return BeaconData!;
        
    }
    
    
}


