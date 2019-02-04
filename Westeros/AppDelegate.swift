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
        
        let starkSigilImage = UIImage(named: "codeIsComming")!
        let starkSigil = Sigil(image: starkSigilImage, description: "Lobo Huargo")
    //    let lannisterSigil = Sigil(image: UIImage(named: "lannister")!, description: "Leon rampante")
        
       let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        
        
        let lannisterSigilImage = UIImage(named: "lannister")!
        let lannisterSigil = Sigil(image: lannisterSigilImage, description: "Leon")
        let lannisterHouse = House(name: "lannister", sigil: lannisterSigil, words: "oye mi rugido")
        
        
        let starkViewController = HouseDetailViewController(model: starkHouse)
        let lannisterViewController = HouseDetailViewController(model: lannisterHouse)
        
       
        //creamos navigation controller
        
        let starkNavigationController = UINavigationController(rootViewController: starkViewController)
        
        let lannisterNavigationController = UINavigationController(rootViewController: lannisterViewController)
        
        
        
        
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [starkNavigationController,lannisterNavigationController]
        
        window?.rootViewController = tabBarController
        
        return true
    }


}

