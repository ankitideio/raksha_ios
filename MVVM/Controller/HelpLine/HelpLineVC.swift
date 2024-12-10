//
//  HelpLineVC.swift
//  Raksha
//
//  Created by Ideio Soft on 03/12/24.
//

import UIKit

class HelpLineVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tblVwHelpline: UITableView!
    
    //MARK: - Variables
    
    var arrEducation: [EducationItem] = [
        EducationItem(title: "File a Complaint", description: "Submit incidents directly and securely to authorities for immediate action.", imageName: "helpline1"),
        EducationItem(title: "Check Status", description: "Track the progress of your previously filed complaints in real-time.", imageName: "helpline2"),
        EducationItem(title: "Nearby Police Station", description: "Locate and contact the nearest police station instantly.", imageName: "helpline3"),
        EducationItem(title: "National Helpline", description: "Quickly access the national helpline number for immediate assistance.", imageName: "helpline4")
    ]
    
    //MARK: - Life Cycle Method¯
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSet()
    }
    
    //MARK: - Funtions
    
    func uiSet(){
        
        let nibNearBy = UINib(nibName: "CommonListTVC", bundle: nil)
        tblVwHelpline.register(nibNearBy, forCellReuseIdentifier: "CommonListTVC")
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

//MARK: - Tableview Delegae and DataSource

extension HelpLineVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrEducation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommonListTVC", for: indexPath) as! CommonListTVC
        cell.imgVwList.image = UIImage(named: arrEducation[indexPath.row].imageName ?? "")
        cell.lblTitle.text = arrEducation[indexPath.row].title ?? ""
        cell.lblDescription.text = arrEducation[indexPath.row].description ?? ""
        cell.topLblTitle.constant = 15
        cell.btmLblDescription.constant = 15
        return cell
    }
}
