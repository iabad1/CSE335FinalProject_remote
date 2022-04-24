//
//  DateTableViewCell.swift
//  CSE335FinalProject
//
//  Created by  on 4/23/22.
//

import UIKit

class DateTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!{
        didSet{
            cellImage.layer.cornerRadius = cellImage.bounds.width / 2
            cellImage.clipsToBounds = true
            
        }
    }
    @IBOutlet weak var cellTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
