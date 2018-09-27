//
//  FavoritesTableViewCell.swift
//  desafio-ios
//
//  Created by Phelipe Campos on 27/09/18.
//  Copyright © 2018 Lopes. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var ivFavorite: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func prepare(with: ComicsDatabase){

        lblTitle.text = with.title
    }
    
}
