//
//  TipsVC.swift
//  Raksha
//
//  Created by Ideio Soft on 04/12/24.
//

import UIKit

class TipsVC: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    var callBack:(()->())?
    
    //MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    //MARK: - Actions
    
    @IBAction func actionBack(_ sender: UIButton) {
        SceneDelegate().tabBarHomeRoot()
        self.callBack?()
    }
    

}
