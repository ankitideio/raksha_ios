//
//  CommonPopoverVC.swift
//  Raksha
//
//  Created by IDEIO SOFT on 09/12/24.
//

import UIKit

class CommonPopoverVC: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet var tblVwList: UITableView!
    
    //MARK: - Variables
    
    var arrList = [String]()
    
    //MARK: - Life cycle method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    
    //MARK: - Functions
    
    private func uiSet(){
        // Register the XIB file
        let nib = UINib(nibName: "PopoverTVC", bundle: nil)
        tblVwList.register(nib, forCellReuseIdentifier: "PopoverTVC")
        appendData()
        tblVwList.reloadData()
    }
    func appendData(){
        arrList.append("Edit")
        arrList.append("Delete")
    }

}
//MARK: - Tableview delegate and datasource

extension CommonPopoverVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 40 
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrList.count > 0{
            return arrList.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopoverTVC", for: indexPath) as! PopoverTVC
        if arrList.count > 0{
            let lastIndex = arrList.count - 1
            let text =  arrList[indexPath.row]
            cell.lblTitle.text = text
            // Hide separator for the last index
            if indexPath.row == lastIndex {
               cell.viewSeprator.isHidden = true
            } else {
               cell.viewSeprator.isHidden = false
            }
        }
        return cell
    }
    
}
