//
//  CommonListTVC.swift
//  Raksha
//
//  Created by Ideio Soft on 03/12/24.
//

import UIKit

class CommonListTVC: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var btmLblDescription: NSLayoutConstraint!
    @IBOutlet weak var topLblTitle: NSLayoutConstraint!
    @IBOutlet weak var vwShadow: UIView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgVwList: UIImageView!
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
