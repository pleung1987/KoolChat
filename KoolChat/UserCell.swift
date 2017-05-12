//
//  UserCell.swift
//  KoolChat
//
//  Created by Patrick Leung on 30/3/2017.
//  Copyright © 2017 Patrick Leung. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCheckmark(selected: false)
    }
    
    func updateUI(user: User) {
        firstNameLbl.text = user.firstName
    }
    
    func setCheckmark(selected: Bool) {
        let imageStr = selected ? "messageindicatorchecked1" : "messageindicator1"
        
        self.accessoryView = UIImageView(image: UIImage(named: imageStr))
    }

}
