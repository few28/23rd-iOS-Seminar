//
//  VC1.swift
//  iOS-FisrtSeminar
//
//  Created by Leeseungsoo on 2018. 10. 9..
//  Copyright © 2018년 Leess. All rights reserved.
//

import Foundation
import UIKit

class VC1_1: UIViewController {
    
    @IBOutlet var dataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    /*
     네비게이션 컨트롤러를 이용한 푸시방식의 화면전환입니다.
     화면은 오른쪽에서 왼쪽으로 전환되고 네비게이션 바를 공유하게 됩니다. (back 버튼 자동생성)
     
     스토리보드에서 Destination 뷰 컨트롤러의 Storyboard ID를 꼭 정의해주어야 합니다.
     해당 뷰컨트롤러를 선택 후 identifier inspector에서 설정 가능합니다.
     */
    @IBAction func pushAction(_ sender: Any) {
        
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "VC2") as? VC2 else { return }
        
        let check = !(dataTextField.text?.isEmpty ?? true)
        //??는 옵셔널 nil 병합 연산자입니다. 앞의 값이 nil일 경우 ??뒤에 명시한 값을 반환합니다.
        //isEmpty는 텍스트필드가 비어있는지에 대한 옵셔널 Bool 값입니다.
        //만약 텍스트필드에 아무런 입력을 안하였다면 true가 반환 되겠죠!
        
        if check { //만약 텍스트필드에 값이 없다면 이 조건문은 실행되지 않겠죠?
            dvc.data = dataTextField.text
            //목적지 뷰컨트롤러의 선언된 변수에 텍스트필드의 데이터를 넣어줍니다.
        }
        
        //네비게이션 컨트롤러를 이용하여 push를 해줍니다.
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    
    
    /*
     present 방식의 화면전환입니다.
     뷰컨트롤러 자체에서 다른 뷰컨트롤러를 직접 호출하여 화면전환을 하는 방식입니다.
     아래에서 위로 화면이 띄워집니다.
     
     present 방식으로 호출 하게되면
     > VC1에서는 presentViewController 속성에 VC2를 할당하게 되고
     > VC2에서는 VC1을 presentignViewController 속성에 할당하게됩니다.
     따라서, 위의 속성을 이용하여 서로를 참조할 수 있겠죠!
     */
    @IBAction func presentAction(_ sender: Any) {
        
        //위에서 dvc를 선언할때 guard let 구문을 썼었죠.
        //if let 은 옵셔널 바인딩을 하는 방법입니다!
        //차이는 if let 은 조건문 안에서만 선언한 dvc를 사용할 수 있다는 것이죠.
        if let dvc = storyboard?.instantiateViewController(withIdentifier: "VC2") as? VC2 {
            
            let check = !(dataTextField.text?.isEmpty ?? true)
            if check {
                dvc.data = dataTextField.text
            }
            
            //present를 해줍니다.
            present(dvc, animated: true)
        }
    }
    
    
}
