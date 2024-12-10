//
//  EducationVC.swift
//  Raksha
//
//  Created by Ideio Soft on 03/12/24.
//

import UIKit

//MARK: - Structure Education Item

struct EducationItem {
    let title: String?
    let description: String?
    let imageName: String?
}

class EducationVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tblVwList: UITableView!
    
    //MARK: - Variables
    
    var arrEducation: [EducationItem] = [
        EducationItem(title: "Rights and Laws", description: "Summaries of key women's rights and safety laws.", imageName: "education1"),
        EducationItem(title: "Self-Defense", description: "Basic self-defense techniques and strategies.", imageName: "education2"),
        EducationItem(title: "Safety Tips", description: "Practical advice for personal safety in various situations.", imageName: "education3"),
        EducationItem(title: "Emergency Procedures", description: "Safety plans and steps to take during an emergency.", imageName: "education4")
    ]
    
    //MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSet()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Will apear")
        if let tabBarController = self.tabBarController as? HomeTabBar {
            tabBarController.setMiddleButtonHidden(false)
        }
    }
    
    //MARK: - Functions
    
    func uiSet(){
        
        let nibNearBy = UINib(nibName: "CommonListTVC", bundle: nil)
        tblVwList.register(nibNearBy, forCellReuseIdentifier: "CommonListTVC")
    }
    
    //MARK: - Actions
    
    @IBAction func actionSideMenu(_ sender: UIButton) {
        if let tabBarController = self.tabBarController as? HomeTabBar {
            tabBarController.setMiddleButtonHidden(true)
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as! MenuVC
        vc.callBack = {
            if let tabBarController = self.tabBarController as? HomeTabBar {
                tabBarController.setMiddleButtonHidden(false)
            }
        }
        vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.present(vc, animated: true)
    }
    
    @IBAction func actionTips(_ sender: UIButton) {
        if let tabBarController = self.tabBarController as? HomeTabBar {
            tabBarController.setMiddleButtonHidden(true)
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TipsVC") as! TipsVC
        vc.callBack = {
            if let tabBarController = self.tabBarController as? HomeTabBar {
                tabBarController.setMiddleButtonHidden(false)
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - Tableview Delegate And DataSource

extension EducationVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrEducation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommonListTVC", for: indexPath) as! CommonListTVC
        cell.imgVwList.image = UIImage(named: arrEducation[indexPath.row].imageName ?? "")
        cell.lblTitle.text = arrEducation[indexPath.row].title ?? ""
        cell.lblDescription.text = arrEducation[indexPath.row].description ?? ""
        cell.topLblTitle.constant = 30
        cell.btmLblDescription.constant = 30
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if let tabBarController = self.tabBarController as? HomeTabBar {
                tabBarController.setMiddleButtonHidden(true)
            }
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RightAndLawsVC") as! RightAndLawsVC
            vc.callBack = {
                if let tabBarController = self.tabBarController as? HomeTabBar {
                    tabBarController.setMiddleButtonHidden(false)
                }
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
          
            if let tabBarController = self.tabBarController as? HomeTabBar {
                tabBarController.setMiddleButtonHidden(true)
            }
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelfDefenceVC") as! SelfDefenceVC
            vc.callBack = {
                if let tabBarController = self.tabBarController as? HomeTabBar {
                    tabBarController.setMiddleButtonHidden(false)
                }
            }
            self.navigationController?.pushViewController(vc, animated: true)
     
        }
    }
}
