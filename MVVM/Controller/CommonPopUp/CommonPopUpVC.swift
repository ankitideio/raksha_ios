//
//  CommonPopUpVC.swift
//  Raksha
//
//  Created by Ideio Soft on 06/12/24.
//

import UIKit

class CommonPopUpVC: UIViewController {
    
    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var imgVwTitle: UIImageView!
    
    var isComingScreen = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func actionYes(_ sender: UIButton) {
        if isComingScreen == "logout"{
            SceneDelegate().loginRoot()
        }
    }
    @IBAction func actionNo(_ sender: UIButton) {
    }
    
 

}
