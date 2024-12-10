//
//  CallerDetailVC.swift
//  Raksha
//
//  Created by Ideio Soft on 05/12/24.
//

import UIKit

class CallerDetailVC: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet var imgVwUser: UIImageView!
    @IBOutlet weak var collVwTimer: UICollectionView!
    @IBOutlet weak var txtFldMobile: UITextField!
    @IBOutlet weak var txtFldName: UITextField!
    
    //MARK: - Variables
    
    private  var arrTime = ["Now","1 min","5 min"]
    var callBack:(()->())?
    
    private var imagePicker = ImagePicker()
    //MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DismissKeyboardOnTap()
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
    
    //MARK: - Actions
    @IBAction func actionSave(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        callBack?()
        
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionGallary(_ sender: UIButton) {
        imagePicker.pickGalleryImage(self) { [weak self] image in
            guard let self = self else { return }
            self.imgVwUser.image = image
                }
    }
    
    @IBAction func actionCamera(_ sender: UIButton) {
        imagePicker.pickCameraImage(self) { [weak self] image in
            guard let self = self else { return }
            self.imgVwUser.image = image
                }
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
