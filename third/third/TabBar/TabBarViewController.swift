//
//  TabBarViewController.swift
//  third
//
//  Created by Melih Bugra Esmek on 22.09.2021.
//

import UIKit

class TabBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabbarConfig()
       
    }


    private func tabbarConfig(){
        guard let tabBar = tabBarController?.tabBar else { return }
        tabBar.barTintColor = .orange
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .black
        
        tabBar.layer.cornerRadius = 20
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        tabBar.layer.masksToBounds = true
        tabBar.layer.borderWidth = 5
        tabBar.layer.borderColor = UIColor.red.cgColor
    }

}
