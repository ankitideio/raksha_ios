//
//  SosVC.swift
//  Raksha
//
//  Created by Ideio Soft on 03/12/24.
//

import UIKit

class SosVC: UIViewController {
    
    //MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    //MARK: - Action
    
    @IBAction func actionCancel(_ sender: UIButton) {
        SceneDelegate().tabBarHomeRoot()
    }
    
}
