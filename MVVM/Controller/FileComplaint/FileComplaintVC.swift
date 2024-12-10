//
//  FileComplaintVC.swift
//  Raksha
//
//  Created by Ideio Soft on 05/12/24.
//

import UIKit
import IQTextView

class FileComplaintVC: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var lblBottomTitle: UILabel!
    @IBOutlet weak var txtVwBrief: IQTextView!
    @IBOutlet weak var vwBrief: UIView!
    @IBOutlet weak var imgVwDropdown: UIImageView!
    @IBOutlet weak var lblSubject: UILabel!
    @IBOutlet weak var vwDetail: UIView!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblHideIdentity: UILabel!
    @IBOutlet weak var vwMyIdentity: UIView!
    
    //MARK: - Life cycle method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DismissKeyboardOnTap()
       
    }
    
    //MARK: - Actions
    
    @IBAction func actionBack(_ sender: UIButton) {
        
    }
    
    @IBAction func actionOnOff(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func actionSelectType(_ sender: UIButton) {
        
    }
    
}
