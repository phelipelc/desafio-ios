//
//  CellValue.swift
//  desafio-ios
//
//  Created by Phelipe Campos on 26/09/18.
//  Copyright © 2018 Lopes. All rights reserved.
//

import UIKit

class CellValue: UITableViewCell {

    @IBOutlet weak var lblValue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
