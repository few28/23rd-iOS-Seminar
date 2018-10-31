//
//  VC3.swift
//  iOS-FisrtSeminar
//
//  Created by Leeseungsoo on 2018. 10. 10..
//  Copyright © 2018년 Leess. All rights reserved.
//

import Foundation
import UIKit

class VC3: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //스토리보드상에서 생성한 Unwind Segue를 수행합니다.
    //Segue의 identifier를 꼭 정의해주어야합니다.
    @IBAction func unwindAction(_ sender: Any) {
        performSegue(withIdentifier: "unwindToMain", sender: self)
    }
    
}
