//
//  DetailViewController.swift
//  ios-ThirdSeminar
//
//  Created by Leeseungsoo on 2018. 10. 27..
//  Copyright © 2018년 Leess. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var albumImg: UIImage?
    var musicTitle: String?
    var singer: String?
    
    @IBOutlet var albumImgView: UIImageView!
    @IBOutlet var musicTtitleLabel: UILabel!
    @IBOutlet var singerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumImgView.image = albumImg
        musicTtitleLabel.text = musicTitle
        singerLabel.text = singer
        
        albumImgView.layer.cornerRadius = 5
        albumImgView.layer.masksToBounds = true
    }

 


}
