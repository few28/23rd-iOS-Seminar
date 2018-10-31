//
//  Music.swift
//  ios-ThirdSeminar
//
//  Created by Leeseungsoo on 2018. 10. 27..
//  Copyright © 2018년 Leess. All rights reserved.
//

import Foundation
import UIKit

// Music 모델입니다. 멤버가 총 세개인 Music 구조체를 선언하였습니다.
struct Music {
    var albumImg: UIImage?
    var musicTitle: String
    var singer: String
    
    init(title: String, singer: String, coverName: String) {
        self.albumImg = UIImage(named: coverName)
        self.musicTitle = title
        self.singer = singer
    }
}





