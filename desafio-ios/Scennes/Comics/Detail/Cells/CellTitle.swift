//
//  TableViewCell.swift
//  desafio-ios
//
//  Created by Phelipe Campos on 26/09/18.
//  Copyright © 2018 Lopes. All rights reserved.
//

import UIKit
protocol DelegateAction {
    func favorited(sender: Any)
}
class CellTitle: UITableViewCell {
    
    var cellDelegate: DelegateAction?
    @IBOutlet weak var btnFavorite: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func addFavorite(_ sender: Any) {
        cellDelegate?.favorited(sender: sender)
    }
    
}
