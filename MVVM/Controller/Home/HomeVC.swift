//
//  HomeVC.swift
//  Raksha
//
//  Created by Ideio Soft on 03/12/24.
//

import UIKit
import MapKit

class HomeVC: UIViewController {
    
    //MARK: - OUTLETS
    
    @IBOutlet weak var mapVw: MKMapView!
    @IBOutlet weak var btnZoom: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAddFirend: UILabel!
    @IBOutlet var collVwUsers: UICollectionView!
    @IBOutlet var lblTiming: UILabel!
    @IBOutlet var viewLiveLocationWithTimer: UIView!
    @IBOutlet var viewAddFriend: UIView!
    @IBOutlet var widthCollVwUsers: NSLayoutConstraint!
    
    //MARK: - VARIABLES
    
    private let locationManager = CLLocationManager()
    private var currentZoomLevel: Double = 10000
    private var isZoomedIn: Bool = false

    
    //MARK: - LIFE CYCLE METHOD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let tabBarController = self.tabBarController as? HomeTabBar {
            tabBarController.setMiddleButtonHidden(false)
        }
    }

    //MARK: - SETUPMAP
    
    private func setupMapView() {
        widthCollVwUsers.constant = CGFloat(3 * 30)
        mapVw.delegate = self
        mapVw.showsUserLocation = false
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    //MARK: - ACTIONS
    
    @IBAction func actionSideMenu(_ sender: UIButton) {
        if let tabBarController = self.tabBarController as? HomeTabBar {
            tabBarController.setMiddleButtonHidden(true)
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as! MenuVC
        vc.callBack = {[weak self] in
            guard let self = self else { return }
            if let tabBarController = self.tabBarController as? HomeTabBar {
                tabBarController.setMiddleButtonHidden(false)
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionTips(_ sender: UIButton) {
        if let tabBarController = self.tabBarController as? HomeTabBar {
            tabBarController.setMiddleButtonHidden(true)
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TipsVC") as! TipsVC
        vc.callBack = {[weak self] in
            guard let self = self else { return }
            if let tabBarController = self.tabBarController as? HomeTabBar {
                tabBarController.setMiddleButtonHidden(false)
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionAddFriend(_ sender: UIButton) {
        if let tabBarController = self.tabBarController as? HomeTabBar {
            tabBarController.setMiddleButtonHidden(true)
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FriendListVC") as! FriendListVC
        vc.callBack = {[weak self] in
            guard let self = self else { return }
            if let tabBarController = self.tabBarController as? HomeTabBar {
                tabBarController.setMiddleButtonHidden(false)
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionZoom(_ sender: UIButton) {
        let zoomStep: Double = 2000
        let minZoomLevel: Double = 1000
        let maxZoomLevel: Double = 20000
        
        if isZoomedIn {
            currentZoomLevel = min(currentZoomLevel + zoomStep, maxZoomLevel)
        } else {
            currentZoomLevel = max(currentZoomLevel - zoomStep, minZoomLevel)
        }

        let center = mapVw.region.center
        let zoomedRegion = MKCoordinateRegion(
            center: center,
            latitudinalMeters: currentZoomLevel,
            longitudinalMeters: currentZoomLevel
        )
        mapVw.setRegion(zoomedRegion, animated: true)
        
        if currentZoomLevel == minZoomLevel {
            isZoomedIn = true
            btnZoom.setImage(UIImage(named: "zoomMin"), for: .normal)
        } else if currentZoomLevel == maxZoomLevel {
            isZoomedIn = false
            btnZoom.setImage(UIImage(named: "zoom"), for: .normal)
        }
    }
    
    @IBAction func actionTrackME(_ sender: UIButton) {
//        if let tabBarController = self.tabBarController as? HomeTabBar {
//            tabBarController.setMiddleButtonHidden(true)
//        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TrackMeVC") as! TrackMeVC
        vc.callBack = {[weak self] in
            guard let self = self else { return }
            if let tabBarController = self.tabBarController as? HomeTabBar {
                tabBarController.setMiddleButtonHidden(false)
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension HomeVC: MKMapViewDelegate,CLLocationManagerDelegate{
    //MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {

            let region = MKCoordinateRegion(
                center: location.coordinate,
                latitudinalMeters: currentZoomLevel,
                longitudinalMeters: currentZoomLevel
            )
            mapVw.setRegion(region, animated: true)
            
            // Remove all existing annotations
            mapVw.removeAnnotations(mapVw.annotations)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            mapVw.addAnnotation(annotation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get user location: \(error.localizedDescription)")
    }
    //MARK: - MKMapViewDelegate
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Ensure the annotation is not the user location
        if annotation is MKUserLocation {
            return nil
        }
        
        // Reuse or create a custom annotation view
        let identifier = "CustomAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKAnnotationView
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        // Set the custom image for the annotation marker
        annotationView?.image = UIImage(named: "annotation")
        return annotationView
    }
}

//MARK: - Collectionview delegate and datasource

extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UsersCVC", for: indexPath) as! UsersCVC
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30, height: 30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return -5
        }
        
}
