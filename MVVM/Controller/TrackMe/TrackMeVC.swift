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
    var selectedTimeIndexes = [Bool](repeating: false, count: 3)
    //MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    
    func uiSet(){
        swipeLeft()
        DismissKeyboardOnTap()
        selectedTimeIndexes[0] = true
            collVwTrackTime.reloadData()
    
    }
    func swipeLeft(){
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
                  swipeRight.direction = .right
                  view.addGestureRecognizer(swipeRight)
    }
    @objc func handleSwipe() {
        navigationController?.popViewController(animated: true)
        
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
            if selectedTimeIndexes[indexPath.row] {
                cell.vwBackground.backgroundColor = UIColor.darkGreen
                cell.lblTime.textColor = UIColor.white
            } else {
                cell.vwBackground.backgroundColor = .white
                cell.lblTime.textColor = UIColor(hex: "#B0BEC5")
            }
            return cell
        }else{
            let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackUserCVC", for: indexPath) as! TrackUserCVC
            cell.btnCross.tag = indexPath.row
            cell.btnCross.addTarget(self, action: #selector(actionCross), for: .touchUpInside)
            return cell
        }
    }
    @objc func actionCross(sender:UIButton){
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collVwTrackTime {
            for i in 0..<selectedTimeIndexes.count {
                selectedTimeIndexes[i] = false
            }
            selectedTimeIndexes[indexPath.row] = true
            collectionView.reloadData()
        }
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collVwTrackTime{
            return CGSize(width: collectionView.frame.size.width / 3.25, height: 40)
        }else{
            return CGSize(width: 90, height: 90)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == collVwTrackTime{
            return 10
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


