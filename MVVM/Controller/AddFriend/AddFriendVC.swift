//
//  AddFriendVC.swift
//  Raksha
//
//  Created by Ideio Soft on 05/12/24.
//

import UIKit
import MaterialComponents

struct AddList {
    let title: String?
    let description: String?
}

class AddFriendVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var vwCallFriend: UIView!
    @IBOutlet weak var vwMobile: UIView!
    @IBOutlet weak var heightTblVw: NSLayoutConstraint!
    @IBOutlet weak var tblVwList: UITableView!
    
    //MARK: - Variables
    
    private var arrList:[AddList] = [AddList(title: "Who is a Friend?", description:"A friend is someone you trust and can rely on during emergencies. This person will receive SOS alerts and 'Track Me' notifications to ensure your safety."),AddList(title: "Tip for Choosing a Friend:", description: "Ensure the person you choose is trustworthy, available and responsive, and consider those who live or work close by for faster assistance.")]
    
    private var txtFldCallFriend: MDCTextField!
    private var txtFldMobile: MDCTextField!
    private var textFieldCallFriend: MDCTextInputControllerOutlined!
    private var textFieldMobile: MDCTextInputControllerOutlined!
    
    //MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uiSet()
    }
    
    //MARK: - Functions
    
    private func uiSet() {
        addCallFriendTextField()
        addMobileTextField()
        DismissKeyboardOnTap()
        tblVwList.estimatedRowHeight = 50
        tblVwList.rowHeight = UITableView.automaticDimension
        tblVwList.delegate = self
        tblVwList.dataSource = self
        tblVwList.reloadData()
        self.updateTableViewHeight()
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
   
    private func addCallFriendTextField() {
        txtFldCallFriend = MDCTextField()
        textFieldCallFriend = MDCTextInputControllerOutlined(textInput: txtFldCallFriend)
        textFieldCallFriend.activeColor = UIColor(hex: "#B0BEC5")
        textFieldCallFriend.borderRadius = 10.0
        textFieldCallFriend.inlinePlaceholderColor = UIColor(hex: "#B0BEC5")
        textFieldCallFriend.normalColor = UIColor(hex: "#B0BEC5")
        textFieldCallFriend.floatingPlaceholderActiveColor = UIColor(hex: "#B0BEC5")
        txtFldCallFriend.placeholder = "What do you call your friend?"
        self.vwCallFriend.addSubview(txtFldCallFriend)
        
        // Set constraints for txtFldCallFriend
        txtFldCallFriend.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            txtFldCallFriend.leadingAnchor.constraint(equalTo: vwCallFriend.leadingAnchor, constant: 0),
            txtFldCallFriend.trailingAnchor.constraint(equalTo: vwCallFriend.trailingAnchor, constant: 0),
            txtFldCallFriend.topAnchor.constraint(equalTo: vwCallFriend.topAnchor, constant: -10),
            txtFldCallFriend.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func addMobileTextField() {
        txtFldMobile = MDCTextField()
        textFieldMobile = MDCTextInputControllerOutlined(textInput: txtFldMobile)
        textFieldMobile.activeColor = UIColor(hex: "#B0BEC5")
        textFieldCallFriend.inlinePlaceholderColor = UIColor(hex: "#B0BEC5")
        textFieldMobile.normalColor = UIColor(hex: "#B0BEC5")
        textFieldMobile.floatingPlaceholderActiveColor = UIColor(hex: "#B0BEC5")
        textFieldMobile.borderRadius = 10.0
        txtFldMobile.placeholder = "Mobile Number"
        self.vwMobile.addSubview(txtFldMobile)
        
        // Set constraints for txtFldMobile
        txtFldMobile.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            txtFldMobile.leadingAnchor.constraint(equalTo: vwMobile.leadingAnchor, constant: 0),
            txtFldMobile.trailingAnchor.constraint(equalTo: vwMobile.trailingAnchor, constant: 0),
            txtFldMobile.topAnchor.constraint(equalTo: vwMobile.topAnchor, constant: -7),
            txtFldMobile.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func updateTableViewHeight() {
        DispatchQueue.main.async {
            self.heightTblVw.constant = self.tblVwList.contentSize.height
            self.view.layoutIfNeeded()
        }
    }
    
    //MARK: - Actions
    
    @IBAction func actionAddFriend(_ sender: UIButton) {
        
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        
    }
    
    @IBAction func actionContact(_ sender: UIButton) {
        
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - Tableview delegate and data source

extension AddFriendVC:UITableViewDelegate,UITableViewDataSource{
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddFriendTVC", for: indexPath) as! AddFriendTVC
        cell.lblTitle.text = arrList[indexPath.row].title ?? ""
        cell.lblDescription.text = arrList[indexPath.row].description ?? ""
        if indexPath.row == 0{
            cell.widthImgProfile.constant = 20
            cell.leadingLblTitle.constant = 8
            cell.imgVwProfile.isHidden = false
        }else{
            cell.leadingLblTitle.constant = 0
            cell.imgVwProfile.isHidden = true
            cell.widthImgProfile.constant = 0
        }
        return cell
    }
    
    
}
