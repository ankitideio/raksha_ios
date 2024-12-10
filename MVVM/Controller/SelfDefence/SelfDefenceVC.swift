//
//  SelfDefenceVC.swift
//  Raksha
//
//  Created by Ideio Soft on 05/12/24.
//

import UIKit

struct DefenceList{
    var title:String?
    var description:String?
    var img:String?
}

class SelfDefenceVC: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var tblVwList: UITableView!
    @IBOutlet weak var lblDescription: UILabel!
    
    //MARK: - Variables
    
    private let arrDefence: [DefenceList] = [
            .init(title: "Hammer Strike", description: "Using your car keys is one of the easiest ways to defend yourself. Don’t use your fingernails, because you’re more at risk to injure your hands.", img: "defence1"),
            .init(title: "Groin kick", description: "If someone is coming at you from the front, a groin kick may deliver enough force to paralyze your attacker, making your escape possible.", img: "defence2"),
            .init(title: "Heel palm strike", description: "This move can cause damage to the nose or throat. To execute, get in front of your attacker as much as possible. An open palm to the ears can be very disorienting.", img: "defence3"),
            .init(title: "Elbow Strike", description: "If your attacker is in close range and you’re unable to get enough momentum to throw a strong punch or kick, use your elbows.", img: "defence4")
        ]
    
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

extension SelfDefenceVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDefence.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelfDefenceTVC", for: indexPath) as! SelfDefenceTVC
        cell.imgVwProfile.image = UIImage(named: arrDefence[indexPath.row].img ?? "")
        cell.lblTitle.text = arrDefence[indexPath.row].title ?? ""
        let text = arrDefence[indexPath.row].description ?? ""
        cell.lblDescription.attributedText = text.createBulletPointText()
        return cell
    }
    
}
