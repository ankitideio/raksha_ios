//
//  CallerDetailVC.swift
//  Raksha
//
//  Created by Ideio Soft on 05/12/24.
//

import UIKit

class CallerDetailVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var collVwTimer: UICollectionView!
    @IBOutlet weak var txtFldMobile: UITextField!
    @IBOutlet weak var txtFldName: UITextField!
    
    //MARK: - Variables
    
    private  var arrTime = ["Now","1 min","5 min"]
    
    //MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DismissKeyboardOnTap()
     
    }
    
    //MARK: - Actions
    
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionGallary(_ sender: UIButton) {
        
    }
    
    @IBAction func actionCamera(_ sender: UIButton) {
        
    }
    
    @IBAction func actionAvtar(_ sender: UIButton) {
        
    }
    
}

//MARK: - Collectionview delegate and datasource

extension CallerDetailVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackTimeCVC", for: indexPath) as! TrackTimeCVC
        cell.lblTime.text = arrTime[indexPath.row]
        if indexPath.row == 0{
            cell.vwBackground.backgroundColor = UIColor(hex: "#60BAAF")
            cell.lblTime.textColor = UIColor.white
        }else{
            cell.vwBackground.backgroundColor = UIColor.white
            cell.lblTime.textColor = UIColor.gray
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collVwTimer.frame.width/3 - 5, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
