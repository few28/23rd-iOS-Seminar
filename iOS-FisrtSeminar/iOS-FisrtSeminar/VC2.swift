//
//  VC2.swift
//  iOS-FisrtSeminar
//
//  Created by Leeseungsoo on 2018. 10. 9..
//  Copyright © 2018년 Leess. All rights reserved.
//

import Foundation
import UIKit

class VC2: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup() //아래의 함수를 viewDidLoad 안의 사용하여 뷰컨트롤러가 로드되면 함수가 호출되게 합니다.
    }
    
    //전달받은 data를 셋팅하기 위한 함수
    func setup() {
        //전달받은 data에 값이 있다면 label의 text를 설정해 줍니다.
        if let transData = data {
            label.text = transData
        }
    }
    
    //네비게이션 컨트롤러에서 pop을 하여 이전 뷰컨트롤러로 돌아갑니다.
    @IBAction func popAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    //present로 띄워진 경우엔 dismiss를 하여 이전 뷰컨트롤러로 돌아갑니다.
    @IBAction func dimissAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
