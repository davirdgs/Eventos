//
//  AppDelegate.swift
//  StaffManager
//
//  Created by Davi Rodrigues on 07/07/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit
import CoreData
//import IMFCore
import Parse
import Bolts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?
    let themeColor = UIColor(red: 0.01, green: 0.41, blue: 0.22, alpha: 1.0)


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window?.tintColor = themeColor
        // Override point for customization after application launch.
        // inicializar o SDK com o ID e a rota do aplicativo IBM Bluemix
        //IMFClient.sharedInstance().initializeWithBackendRoute("https://staff-manager.mybluemix.net", backendGUID: "f774301e-a5e7-4d7a-9d5a-4c37617a032a")
        
        Parse.enableLocalDatastore()
        
        //Initialize Parse
        Parse.setApplicationId("C7e9znBfFBQuIKNiOXuJMpKyA5K73wU0kP0991ju", clientKey: "tFXdXawOeku9bKQhG980xfh2to1iLUKGV4j84KMG")
        
        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
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
        // Saves changes in the application's managed object context before the application terminates.
      //  self.saveContext()
    }

 

}

