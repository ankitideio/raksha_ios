//
//  SetCallerDetailVC.swift
//  Raksha
//
//  Created by IDEIO SOFT on 09/12/24.
//

import UIKit

class SetCallerDetailVC: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet var btnGetCall: UIButton!
    @IBOutlet var viewSuccess: UIView!
    @IBOutlet var collVwTime: UICollectionView!
    //MARK: - Variables
    
    private  var arrTime = ["Now","1 min","5 min"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func actionEdit(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CallerDetailVC") as! CallerDetailVC
        self.navigationController?.pushViewController(vc, animated: true)

    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
//MARK: - Collectionview delegate and datasource

extension SetCallerDetailVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
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
        return CGSize(width: collVwTime.frame.width/3 - 5, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
