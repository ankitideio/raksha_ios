//
//  HomeTabBar.swift
//  Raksha
//
//  Created by Ideio Soft on 03/12/24.
//

import UIKit

class HomeTabBar: UITabBarController, UITabBarControllerDelegate {

    // MARK: - VARIABLE
    
    private let middleButton = UIButton()
    
    // MARK: - LIFE CYCLE METHOD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
       
        setupMiddleButton()
        addShadowToTabBar()
    }
   
    
    // MARK: - Show or hide the middle button
    func setMiddleButtonHidden(_ hidden: Bool) {
        middleButton.isHidden = hidden
    }
   
    // MARK: - Sets up the middle button as an overlay
    
     func setupMiddleButton() {
        middleButton.frame.size = CGSize(width: 70, height: 70)
        middleButton.layer.cornerRadius = 35
        let deviceHasNotch = UIApplication.shared.hasNotch
        if deviceHasNotch {
            middleButton.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height - tabBar.bounds.height - 20)
        } else {
            middleButton.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height - tabBar.bounds.height + 15)
        }

        middleButton.setImage(UIImage(named: "sos")?.withRenderingMode(.alwaysOriginal), for: .normal)
        middleButton.imageView?.contentMode = .scaleAspectFit
        middleButton.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        middleButton.backgroundColor = .clear
        middleButton.tintColor = .white
        middleButton.addTarget(self, action: #selector(middleButtonTapped), for: .touchUpInside)

        view.addSubview(middleButton)
        view.layer.insertSublayer(middleButton.layer, above: tabBar.layer)
         view.bringSubviewToFront(middleButton)
    }

    // MARK: - Handles middle button tap
    
    @objc private func middleButtonTapped() {
        print("Middle button tapped!")
        SceneDelegate().sosRoot()
    }

    // MARK: - Adds a shadow to the tab bar
    
    private func addShadowToTabBar() {
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.shadowRadius = 4
        tabBar.layer.masksToBounds = false
    }

    // MARK: - Delegate method for tab bar item selection
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Selected item \(item.tag)")
    }
}


