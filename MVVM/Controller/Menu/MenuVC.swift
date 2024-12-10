//
//  MenuVC.swift
//  Raksha
//
//  Created by Ideio Soft on 05/12/24.
//

import UIKit

struct MenuList {
    let title: String?
    let img: String?
}

class MenuVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var heightTblVw: NSLayoutConstraint!
    @IBOutlet weak var tblVwMenuList: UITableView!
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgVwProfile: UIImageView!
    
    
    //MARK: - Variables
    
    var arrMenu:[MenuList] = [MenuList(title: "History", img: "history"),
                              MenuList(title: "Friends", img: "Users"),
                              MenuList(title: "Privacy Policy", img: "privacy"),
                              MenuList(title: "Language", img: "language"),
                              MenuList(title: "Contact Us", img: "contctUs"),
                              MenuList(title: "About Us", img: "aboutus")]
    
    var callBack:(()->())?
    
    //MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
    }
    
    //MARK: - Actions
    
    @IBAction func actionCross(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.callBack?()
    }
    
    @IBAction func actionEdit(_ sender: UIButton) {
        
    }
    
    @IBAction func actionLogout(_ sender: UIButton) {
        let  vc = self.storyboard?.instantiateViewController(withIdentifier: "CommonPopUpVC") as! CommonPopUpVC
        vc.isComingScreen = "logout"
        vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.present(vc, animated: true)
    }
}

//MARK: - Tableview delegate and datasource

extension MenuVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTVC", for: indexPath) as! MenuTVC
        cell.imgVwMenu.image = UIImage(named: arrMenu[indexPath.row].img ?? "")
        cell.lblMenu.text = arrMenu[indexPath.row].title ?? ""
        
        return cell
    }
    
    
}
