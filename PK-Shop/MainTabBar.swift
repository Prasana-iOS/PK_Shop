//
//  MainTabBar.swift
//  PK-Shop
//
//  Created by Trioangle on 27/08/24.
//

import UIKit

class MainTabBar: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: self.tabBar.bounds.minY , width: self.tabBar.bounds.width, height: self.tabBar.bounds.height + 41), cornerRadius: 0).cgPath
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        layer.shadowRadius = 25.0
        layer.shadowOpacity = 0.3
        layer.borderWidth = 1.0
        layer.opacity = 1.0
        layer.isHidden = false
        layer.masksToBounds = false
        layer.fillColor = UIColor.white.cgColor
        self.tabBar.layer.insertSublayer(layer, at: 0)
        
        self.tabBar.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.tabBar.itemWidth = (self.view.frame.width / 5)
        //self.tabBar.itemPositioning = .centered
        self.delegate = self
        self.tabBar.barTintColor = UIColor.init(named: "#FF5A5F")
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundImage = nil
        self.tabBar.barStyle = .blackOpaque
        self.tabBar.setValue(true, forKey: "hidesShadow")
        
        UITabBar.appearance().tintColor =  UIColor.black
        UITabBar.appearance().barTintColor = UIColor.red
      
        let myVC0 = HomeVC()
            let icon0 = UITabBarItem(title: "", image: UIImage(named: "home"), selectedImage: UIImage(named: "select_home"))
            myVC0.tabBarItem = icon0
        let nvc0 = UINavigationController(rootViewController: myVC0)

        let myVC1 = SearchVC()
        let icon1 = UITabBarItem(title: "", image: UIImage(named: "search"), selectedImage: UIImage(named: "select_search"))
        myVC1.tabBarItem = icon1
        let nvc1 = UINavigationController(rootViewController: myVC1)

        let myVC2 = SavedVC()
        let icon2 = UITabBarItem(title: "", image: UIImage(named: "saved"), selectedImage: UIImage(named: "select_saved"))
        myVC2.tabBarItem = icon2
        let nvc2 = UINavigationController(rootViewController: myVC2)
        
        let myVC3 = ProfileVC()
        let icon3 = UITabBarItem(title: "", image: UIImage(named: "profile"), selectedImage: UIImage(named: "select_profile"))
        myVC3.tabBarItem = icon3
        let nvc3 = UINavigationController(rootViewController: myVC3)
        
        let controllers = [nvc0,nvc1,nvc2,nvc3]
        self.viewControllers = controllers
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 65
        tabBar.frame.origin.y = view.frame.height - 65
       
    }

    
}
