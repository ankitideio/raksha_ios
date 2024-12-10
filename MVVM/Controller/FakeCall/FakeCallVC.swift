//
//  FakeCallVC.swift
//  Raksha
//
//  Created by Ideio Soft on 03/12/24.
//

import UIKit

class FakeCallVC: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var btnFakeCall: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var tblVwFakeCallList: UITableView!
    //MARK: - variables
    private  var arrTime = ["Now","1 min","5 min"]

    //MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   //MARK: - Actions
    
    @IBAction func actionSideMenu(_ sender: UIButton) {
        if let tabBarController = self.tabBarController as? HomeTabBar {
            tabBarController.setMiddleButtonHidden(true)
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as! MenuVC
        vc.callBack = {[weak self] in
            if let tabBarController = self?.tabBarController as? HomeTabBar {
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
        vc.callBack = {[weak self] in
            if let tabBarController = self?.tabBarController as? HomeTabBar {
                tabBarController.setMiddleButtonHidden(false)
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionFakeCall(_ sender: UIButton) {
        
    }
}

//MARK: - Tableview Delegate And DataSource

extension FakeCallVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return 2
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FakeCallListTVC") as! FakeCallListTVC
        if indexPath.section == 0{
            cell.btnEdit.isHidden = false
            cell.btnCheckBox.isHidden = true
            cell.imgVwPorfile.image = UIImage(named: "")
            cell.lblName.text = "Caller Details"
            cell.lblMobileNo.text = "Set Caller details"
            cell.btnEdit.tag = indexPath.row
            cell.btnEdit.addTarget(self, action: #selector(actionEdit), for: .touchUpInside)

        }else{
            cell.btnEdit.isHidden = true
            cell.btnCheckBox.isHidden = false
            cell.imgVwPorfile.image = UIImage(named: "avatar")
            cell.lblName.text = "Dad"
            cell.lblMobileNo.text = "S9632458456"
            cell.btnCheckBox.tag = indexPath.row
            cell.btnCheckBox.addTarget(self, action: #selector(actionCheckBox), for: .touchUpInside)

        }
        return cell
    }
    @objc func actionEdit(sender:UIButton){
        
    }
    

    @objc func actionCheckBox(sender:UIButton){
        sender.isSelected = !sender.isSelected
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SetCallerDetailVC") as! SetCallerDetailVC
        self.navigationController?.pushViewController(vc, animated: true)

    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        } else {
            return "Choose from previously set callers"
        }
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            if section == 1 {
                header.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                header.textLabel?.textColor = UIColor(hex: "#333333")
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            if section == 0 {
                return 0
            }
            return 50
        }
    
}
