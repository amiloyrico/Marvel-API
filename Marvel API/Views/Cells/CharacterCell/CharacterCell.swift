//
//  CharacterCell.swift
//  Marvel API
//
//  Created by Alba Yolima Rico Montenegro on 9/11/22.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    
    @IBOutlet weak var IconImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
