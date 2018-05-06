//
//  TabBarController.swift
//  Sick Beatz
//
//  Created by Henry on 4/28/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Not So Sick Beatz"
        self.tabBar.barTintColor = UIColor.black
        
        let homeVC = HomeViewController()
//        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home pressed"))
        
        let myMusicVC = MyMusicViewController()
//        myMusicVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        
        myMusicVC.tabBarItem = UITabBarItem(title: "My Music", image: UIImage(named: "person"), selectedImage: UIImage(named: "person selected"))
        
        let socialVC = SocialViewController()
//        socialVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
        
        socialVC.tabBarItem = UITabBarItem(title: "Social", image: UIImage(named: "people"), selectedImage: UIImage(named: "people selected"))
        
        let discoverVC = DiscoverViewController()
//        discoverVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 3)
        
        discoverVC.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(named: "eye"), selectedImage: UIImage(named: "eye pressed"))
        
        let tabBarList = [homeVC, myMusicVC, socialVC, discoverVC]
        
        viewControllers = tabBarList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
