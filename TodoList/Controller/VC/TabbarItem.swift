//
//  TabbarItem.swift
//  Project
//
//  Created by Sherzod on 08/03/22.
//

import UIKit

class TabbarItem: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabbarItem()
        self.tabBar.backgroundColor = .white
    }
    
    
    func tabbarItem() {
        
        let mainVC = MainVC(nibName: "MainVC", bundle: nil)
        mainVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: nil)
        
        let walk = ProjectsVC(nibName: "ProjectsVC", bundle: nil)
        walk.tabBarItem = UITabBarItem(title: "Task", image: UIImage(systemName: "house"), selectedImage: nil)
        
        
        viewControllers = [mainVC, walk]
    }
    
}
