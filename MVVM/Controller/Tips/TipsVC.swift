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
        swipeLeft()
    }
    func swipeLeft(){
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
                  swipeRight.direction = .right
                  view.addGestureRecognizer(swipeRight)
    }
    @objc func handleSwipe() {
        navigationController?.popViewController(animated: true)
        
    }
    //MARK: - Actions
    
    @IBAction func actionBack(_ sender: UIButton) {
        SceneDelegate().tabBarHomeRoot()
        self.callBack?()
    }
    

}
