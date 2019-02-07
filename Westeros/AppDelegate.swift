//
//  AppDelegate.swift
//  Westeros
//
//  Created by Dani rica on 31/01/2019.
//  Copyright © 2019 Dani rica. All rights reserved.
//

import UIKit 

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .red
        
        
        //crear los modelos
        let houses = Repository.local.houses
        
      /*
        
        //crear los controladores
       let controllers =
        houses
            .map { HouseDetailViewController(model: $0 )}
            .map { $0.wrappedInNavigation()}
      */
       
        //creamos navigation controller
        /*
        let starkNavigationController = starkViewController.wrappedInNavigation()
        let lannisterNavigationController = lannisterViewController.wrappedInNavigation()
        */
        
        
        //Tab inferior
     
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = houses.map {HouseDetailViewController(model: $0).wrappedInNavigation()}
       
        
        
        window?.rootViewController = tabBarController
        
        return true
    }


}

