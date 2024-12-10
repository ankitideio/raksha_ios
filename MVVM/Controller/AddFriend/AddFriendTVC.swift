//
//  AddFriendTVC.swift
//  Raksha
//
//  Created by Ideio Soft on 05/12/24.
//

import UIKit

class AddFriendTVC: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet var leadingLblTitle: NSLayoutConstraint!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var widthImgProfile: NSLayoutConstraint!
    @IBOutlet weak var imgVwProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}
