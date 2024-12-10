//
//  TrackUserList.swift
//  Raksha
//
//  Created by Ideio Soft on 04/12/24.
//

import UIKit

class TrackUserList: UITableViewCell {

    @IBOutlet var btnThreedot: UIButton!
    @IBOutlet weak var btnCheckBox: UIButton!
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgVwProfile: UIImageView!
    @IBOutlet weak var vwBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
