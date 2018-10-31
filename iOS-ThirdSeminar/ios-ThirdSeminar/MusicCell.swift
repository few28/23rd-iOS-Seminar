//
//  MusicCell.swift
//  ios-ThirdSeminar
//
//  Created by Leeseungsoo on 2018. 10. 27..
//  Copyright © 2018년 Leess. All rights reserved.
//

import UIKit

class MusicCell: UITableViewCell {
    
    @IBOutlet var albumImg: UIImageView!
    @IBOutlet var musicTitle: UILabel!
    @IBOutlet var singer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        albumImg.layer.cornerRadius = 3
        albumImg.layer.masksToBounds = true
    }

   

}
