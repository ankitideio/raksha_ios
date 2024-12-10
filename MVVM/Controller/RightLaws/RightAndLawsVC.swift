//
//  RightAndLawsVC.swift
//  Raksha
//
//  Created by Ideio Soft on 05/12/24.
//

import UIKit

class RightAndLawsVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var tblVwList: UITableView!
    
    //MARK: - Variables
    
    var callBack:(()->())?
    
    var arrLaws = ["Acid Attack (Section 326A and 326B)","Rape (Sections 375, 376, 376A, 376B, 376C, 376D, and 376E)","Kidnapping and abduction for different purposes (Sections 363-373)","Murder, Dowry Death, Abetment of Suicide, etc. (Sections 302, 304B, and 306)","Cruelty by husband or his relatives (Section 498A)","Sexual harassment (Section 354A)","Sexual harassment (Section 354A)","Stalking (Section 354D)","Word, gesture, or act intended to insult the modesty of a woman (Section 509)","Murder, Dowry Death, Abetment of Suicide, etc. (Sections 302, 304B, and 306)"]
    
    //MARK: - Life cycle method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DismissKeyboardOnTap()
        swipeLeft()
    }
    func swipeLeft(){
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
                  swipeRight.direction = .right
                  view.addGestureRecognizer(swipeRight)
    }
    @objc func handleSwipe() {
        SceneDelegate().tabBarHomeRoot()
        callBack?()
    }
    //MARK: - Action
    
    @IBAction func actionBack(_ sender: UIButton) {
        SceneDelegate().tabBarHomeRoot()
        callBack?()
    }
    
}

//MARK: - Tableview delegate and datasource

extension RightAndLawsVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrLaws.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RightAndLawsTVC", for: indexPath) as! RightAndLawsTVC
        let text =  arrLaws[indexPath.row]
        cell.lblDescription.attributedText = text.createBulletPointText()
        return cell
    }
    
}
