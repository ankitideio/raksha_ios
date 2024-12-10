//
//  FriendListVC.swift
//  Raksha
//
//  Created by Ideio Soft on 05/12/24.
//

import UIKit

class FriendListVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tblVwFriendList: UITableView!
    
    //MARK: - Variables
    var callBack:(()->())?
    
    //MARK: - Life cycle method
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    //MARK: - Actions
    
    @IBAction func actionBack(_ sender: UIButton) {
        SceneDelegate().tabBarHomeRoot()
        callBack?()
    }
    
    @IBAction func actionAddFriend(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddFriendVC") as! AddFriendVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - Tableview delegate and datasource

extension FriendListVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackUserList", for: indexPath) as! TrackUserList
        cell.btnThreedot.tag = indexPath.row
        cell.btnThreedot.addTarget(self, action: #selector(actionThreeDot), for: .touchUpInside)
        return cell
    }
    @objc func actionThreeDot(sender:UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CommonPopoverVC") as! CommonPopoverVC
           vc.modalPresentationStyle = .popover
        vc.preferredContentSize = CGSize(width: 80, height: 80)
           if let popoverController = vc.popoverPresentationController {
               popoverController.sourceView = sender
               popoverController.sourceRect = sender.bounds
               popoverController.permittedArrowDirections = .up
               popoverController.delegate = self
           }
           self.present(vc, animated: true)
    }

    
}

//MARK: - UIPopoverPresentationControllerDelegate

extension FriendListVC: UIPopoverPresentationControllerDelegate {

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {

    }

    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
}
