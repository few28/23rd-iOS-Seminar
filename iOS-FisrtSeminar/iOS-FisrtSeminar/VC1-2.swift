//
//  VC1-2.swift
//  iOS-FisrtSeminar
//
//  Created by Leeseungsoo on 2018. 10. 9..
//  Copyright © 2018년 Leess. All rights reserved.
//

import Foundation
import UIKit

class VC1_2: UIViewController {
    
    /*
     세그를 이용한 방식은 인터페이스 빌더 상에서 세그웨이 객체를 생성하고
     생성된 세그웨이 객체의 성격에 따라 화면전환이 이루어집니다.
     세그웨이를 이용하면 뷰컨트롤러 객체를 직접 생성하지 않아도 됩니다.
     
     세그의 출발이 뷰컨트롤러인 경우에는 Menual Segue,
     버튼이나 기타 컨트롤이 출발인 경우는 Action Segue 라고 합니다.
     */
    
    /*
     - Action Segue
     Action Segue는 터치 또는 클릭 이벤트를 발생시켜 세그웨이를 실행합니다.
     화면전환을 위해 코드 작성을 하지 않아도 스토리보드 상에서 버튼같은 트리거에 연결된 세그웨이를 지정하므로
     전체적인 구성이 단순해지고, 스토리보드의 직관성있는 뷰컨트롤러 트리구조를 확인할 수 있습니다.
     
     Present Modally는 present와 동일하고
     Show는 해당 뷰컨트롤러가 네비게이션 컨트롤러에 연결되어있다면 Push,
     그렇지 않으면 Present 방식이 지정됩니다.
     */
    
    @IBOutlet var dataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    /*
     - Menual Segue
     Menual Segue는 performSegue 메소드를 이용하여 세그를 직접 수동으로 호출합니다.
     스토리보드에 생성된 세그웨이의 identifier를 꼭 설정해주어야 합니다.
     */
    @IBAction func menualShow(_ sender: Any) {
        performSegue(withIdentifier: "menual_show", sender: self)
    }
    
    @IBAction func menualPresent(_ sender: Any) {
        performSegue(withIdentifier: "menual_present", sender: self)
    }
    
    
    /*
     세그를 통한 화면전환을 이용할 시 데이터전달이나 기타 여러 작업들을 하려면
     아래의 prepare 메소드를 통해 전처리가 가능합니다.
     이 메소드는 시스템이 호출하기 때문에 우리가 호출하고 싶을 때 임의로 호출하지 못합니다.
     하나의 전처리 메소드를 여러 세그웨이가 공유하기 때문에,
     segue.identifier를 통해 어떤 세그웨이 객체인지 구분 할 수 있습니다.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "action_show" {
            let txt = dataTextField.text
            let dvc = segue.destination as! VC2
            dvc.data = txt
            // segue.destination은 세그웨이 목적지 뷰컨트롤러를 의미합니다.
            // 위와같이 데이터전달을 수행할 수 있습니다.
            
        } else if segue.identifier == "action_present" {
            let txt = dataTextField.text
            let dvc = segue.destination as! VC2
            dvc.data = txt
        } else if segue.identifier == "menual_show" {
            let txt = dataTextField.text
            let dvc = segue.destination as! VC2
            dvc.data = txt
        } else if segue.identifier == "menual_present" {
            let txt = dataTextField.text
            let dvc = segue.destination as! VC2
            dvc.data = txt
        }
    }
    
    
    // Unwind Segue를 위하여 돌아가고자 하는 뷰컨트롤러에 아래와 같이 명시합니다.
    @IBAction func unwindToMain(_ sender: UIStoryboardSegue) {
        
    }
    
    
   
    
}
