//
//  AttendeeDetailCell.swift
//  Exam
//
//  Created by Romelyn C. Jimenez on 12/27/18.
//  Copyright © 2018 Romelyn C. Jimenez. All rights reserved.
//

import UIKit

class AttendeeDetailCell: UITableViewCell {
    @IBOutlet var value: UILabel!
    @IBOutlet var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
