//
//  FakeCallListTVC.swift
//  Raksha
//
//  Created by Ideio Soft on 04/12/24.
//

import UIKit

class FakeCallListTVC: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet var btnCheckBox: UIButton!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var lblMobileNo: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgVwPorfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
