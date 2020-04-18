//
//  MovieCell.swift
//  flix
//
//  Created by Kushal Kuchibhotla on 4/15/20.
//  Copyright © 2020 Kushal Kuchibhotla. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var SynopsisLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var PosterLabel: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
