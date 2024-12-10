//
//  SetCallerDetailVC.swift
//  Raksha
//
//  Created by IDEIO SOFT on 09/12/24.
//

import UIKit

class SetCallerDetailVC: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet var imgVwSuccess: UIImageView!
    @IBOutlet var imgVwUpdate: UIImageView!
    @IBOutlet var lblPretimer: UILabel!
    @IBOutlet var btnGetCall: UIButton!
    @IBOutlet var viewSuccess: UIView!
    @IBOutlet var collVwTime: UICollectionView!
    //MARK: - Variables
    
    private  var arrTime = ["Now","1 min","5 min"]
    var selectedTimeIndexes = [Bool](repeating: false, count: 3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        selectedTimeIndexes[0] = true
        
        setupShadowForSuccessView()
        imgVwUpdate.isHidden = true
        viewSuccess.isHidden = true
        lblPretimer.isHidden = false
        collVwTime.isHidden = false
        btnGetCall.isHidden = false
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
    private func setupShadowForSuccessView() {
        viewSuccess.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        viewSuccess.layer.shadowOffset = CGSize(width: 0, height: 2)
        viewSuccess.layer.shadowOpacity = 1
        viewSuccess.layer.shadowRadius = 4
        viewSuccess.layer.masksToBounds = false
    }
    
    //MARK: - IBAction
    
    @IBAction func actionEdit(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CallerDetailVC") as! CallerDetailVC
        vc.callBack = {[weak self] in
            guard let self = self else { return }
            if let (gifImageView, _) = UIImageView.fromGif(frame: imgVwSuccess.frame, resourceName: "success") {
                imgVwSuccess.addSubview(gifImageView ?? UIImageView())
            }

            self.imgVwUpdate.isHidden = false
            self.viewSuccess.isHidden = false
            self.lblPretimer.isHidden = true
            self.collVwTime.isHidden = true
            self.btnGetCall.isHidden = true
        }
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
        if selectedTimeIndexes[indexPath.row] {
            cell.vwBackground.backgroundColor = UIColor.darkGreen
            cell.lblTime.textColor = UIColor.white
        } else {
            cell.vwBackground.backgroundColor = .white
            cell.lblTime.textColor = UIColor(hex: "#B0BEC5")
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collVwTime {
            selectedTimeIndexes = [Bool](repeating: false, count: arrTime.count)
                selectedTimeIndexes[indexPath.row] = true
                collectionView.reloadData()
        }
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
