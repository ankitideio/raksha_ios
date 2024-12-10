//
//  WalkThroughVC.swift
//  Raksha
//
//  Created by Ideio Soft on 02/12/24.
//

import UIKit

class WalkThroughVC: UIViewController {
    
    //MARK: - OUTLETS
    
    @IBOutlet weak var bottomStartBtn: NSLayoutConstraint!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var collVwWalk: UICollectionView!
    
    //MARK: - VARIABLES
    
    var arrWalk = ["Walk1", "Walk2", "Walk3", "Walk4"]
    var arrTitle = ["Fake Calls","Educate Yourself","Track Me","Helpline"]
    var arrDescription = ["Now you can schedule your fake calls in difficult situations.","Educate yourself about laws and your rights to stay informed and protected.","Now you can enable follow me for your safety.","Know the emergency helpline numbers for quick assistance."]
    var timer: Timer?
    var currentIndex = 0
    private var pillPageControl: PillPageControl!
    
    //MARK: - APP DELEGATE METHOD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTimer()
        
    }
    
    deinit {
        timer?.invalidate()
    }
    
    //MARK: - FUNCTIONS
    
    func setupTimer() {
        let deviceHasNotch = UIApplication.shared.hasNotch
            pillPageControl = PillPageControl(numberOfPages: 4, currentPage: 0)
            pillPageControl.translatesAutoresizingMaskIntoConstraints = false
            pillPageControl.selectedColor = UIColor.purple
            view.addSubview(pillPageControl)
          
        
        if deviceHasNotch {
            bottomStartBtn.constant = 75
            NSLayoutConstraint.activate([
                pillPageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                pillPageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
            ])
        } else {
            bottomStartBtn.constant = 90
            NSLayoutConstraint.activate([
                pillPageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                pillPageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
            ])
        }
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
    }
    
    @objc func scrollToNextItem() {
        guard !arrWalk.isEmpty else { return }
        
        if currentIndex < arrWalk.count - 1 {
            currentIndex += 1
            self.pillPageControl.setCurrentPage(currentIndex)
        } else {
            self.pillPageControl.setCurrentPage(0)
            currentIndex = 0
            timer?.invalidate()
            timer = nil
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        let indexPath = IndexPath(item: currentIndex, section: 0)
        collVwWalk.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
       
    }
    
    //MARK: - ACTIONS
    
    @IBAction func actionStart(_ sender: UIButton) {
        timer?.invalidate()
        timer = nil
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - COLLECTIONVIEW DELEGATE AND DATA SOURCE

extension WalkThroughVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrWalk.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WalkThroughCVC", for: indexPath) as! WalkThroughCVC
        cell.imgVwWalk.image = UIImage(named: arrWalk[indexPath.row])
        cell.lblTitle.text = arrTitle[indexPath.row]
        cell.lblDescription.text = arrDescription[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
