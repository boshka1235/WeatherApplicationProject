//
//  AppDelegate.swift
//  firsApiProgect
//
//  Created by Oatmeal Simon on 10/26/21.
//  Copyright © 2021 Oatmeal Simon. All rights reserved.
//

import UIKit


var window: UIWindow?

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
	
		
		let apiController = ApiController()
		

		window = UIWindow(frame: UIScreen.main.bounds)
		window?.makeKeyAndVisible()
		window?.rootViewController = apiController
	
	return true
	}
}
