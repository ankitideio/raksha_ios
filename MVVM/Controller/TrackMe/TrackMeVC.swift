//
//  TrackMeVC.swift
//  Raksha
//
//  Created by Ideio Soft on 04/12/24.
//

import UIKit

class TrackMeVC: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var txtFldSearch: UITextField!
    @IBOutlet weak var collVwUserList: UICollectionView!
    @IBOutlet weak var heightTblVw: NSLayoutConstraint!
    @IBOutlet weak var tblVwTrackUser: UITableView!
    @IBOutlet weak var collVwTrackTime: UICollectionView!
    
    //MARK: - Variables
    
    var arrTime = ["15 minutes","1 hour","8 hours"]
    var callBack:(()->())?
    
    //MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DismissKeyboardOnTap()
    }
    
    //MARK: - Action
    
    @IBAction func actionBack(_ sender: UIButton) {
        SceneDelegate().tabBarHomeRoot()
        callBack?()
    }
    
  
}

//MARK: - Collectionview delegate and data source

extension TrackMeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collVwTrackTime{
            return arrTime.count
        }else{
            return 1
        }
      
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collVwTrackTime{
            let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackTimeCVC", for: indexPath) as! TrackTimeCVC
            cell.lblTime.text = arrTime[indexPath.row]
            if indexPath.row == 0{
                cell.vwBackground.backgroundColor = UIColor.darkGreen
                cell.lblTime.textColor = UIColor.white
            }else{
                cell.vwBackground.backgroundColor = UIColor.darkGreen.withAlphaComponent(0.05)
                cell.lblTime.textColor = UIColor.black
            }
            return cell
        }else{
            let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackUserCVC", for: indexPath) as! TrackUserCVC
           
          
            return cell
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = arrTime[indexPath.row]
        if collectionView == collVwTrackTime{
            let font = UIFont.systemFont(ofSize: 16)
            let textWidth = text.width(withFont: font)
            let padding: CGFloat = 26
            let itemWidth = textWidth + padding
            return CGSize(width: itemWidth, height: 40)
        }else{
            return CGSize(width: 90, height: 90)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == collVwTrackTime{
            return 40
        }else{
            return 10
        }
    }
}


//MARK: - Tableview delegate and data source

extension TrackMeVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackUserList", for: indexPath) as! TrackUserList
        cell.btnCheckBox.tag = indexPath.row
        cell.btnCheckBox.addTarget(self, action: #selector(actionCheckBox), for: .touchUpInside)
        return cell
    }
    @objc func actionCheckBox(sender:UIButton){
        sender.isSelected = !sender.isSelected
    }
    
}


