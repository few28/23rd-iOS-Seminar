//
//  ViewController.swift
//  ios-ThirdSeminar
//
//  Created by Leeseungsoo on 2018. 10. 27..
//  Copyright © 2018년 Leess. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var partTextField: UITextField!
    @IBOutlet var partImg: UIImageView!
    
    var picker: UIPickerView! //파트를 선택할 피커뷰를 선언합니다. 아직 초기화는 안된상태.
    var toolbar: UIToolbar! //피커뷰의 목록을 선택하는 이벤트를 만들기 위해 툴바를 하나 선언합니다.
    
    //피커뷰의 각 행에 들어갈 데이터들입니다.
    let parts: [String] = ["기획", "디자인", "서버", "안드로이드", "iOS"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPicker()
        setupToolbar()
    }
    
    //피커뷰의 초기화를 진행합니다.
    func setupPicker() {
        picker = UIPickerView() //아직 초기화가 안된 피커뷰의 초기화
        picker.delegate = self //delegate를 위임받기 위해 피커뷰의 delegate는 self(뷰컨트롤러)라고 선언합니다.
        picker.dataSource = self //위와 동일
        partTextField.inputView = picker //텍스트필드를 수정하는 뷰를 키보드가 아닌 피커뷰로 사용하기 위한 과정입니다.
    }
    
    //피커뷰와 같이 사용할 툴바의 초기화와 설정을 진행합니다.
    func setupToolbar() {
        //가로는 view의 width와 동일하고 높이는 40인 frame의 값으로 툴바를 초기화 합니다.
        toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        
        //툴바에 들어갈 버튼 하나를 초기화합니다. UIToolbar에 들어가는 UIBarButtonItem을 이용합니다.
        //title은 "done", 버튼 style은 done과 plain이 있는데 done으로 합니다.
        //action에는 버튼을 클릭했을때의 action으로 selector 함수를 추가해줍니다.
        let done = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(selectPart))
        
        //툴바에 단순히 빈공간을 차지할 flexibleSpace를 초기화합니다.
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        //위에서 선언한 flexibleSpace와 butten을 툴바에 넣어줍니다.
        toolbar.setItems([space, done], animated: true)
        
        //텍스트필드의 악세사리 뷰를 툴바로 설정합니다.
        //악세사리 뷰는 한번 공식문서를 보는게 이해가빠릅니다!
        partTextField.inputAccessoryView = toolbar
    }

    //툴바의 done 버튼을 눌렀을 때 실행되는 액션입니다.
    @objc func selectPart() {
        let row = picker.selectedRow(inComponent: 0) //현재 선택된 피커뷰의 row를 가져옵니다.
        let part = parts[row] //그 row를 이용하여 parts에서 해당되는 데이터를 설정하고
        partTextField.text = part //그 데이터를 텍스트필드의 text로 set합니다.
        
        //아래는 위에서 가져온 파트에 따라 이미지뷰의 이미지를 설정해주는 switch구문입니다.
        switch part {
        case "기획":
            partImg.image = UIImage(named: "sopt_doplan")
        case "디자인":
            partImg.image = UIImage(named: "sopt_dodesign")
        case "서버", "안드로이드", "iOS":
            partImg.image = UIImage(named: "sopt_dodevelop")
        default:
            break
        }
        
        partTextField.endEditing(true) //endEditing(true)는 텍스트필드의 입력상태를 해제합니다.
    }



}

//피커뷰의 delegate를 채택하는 extension 구문입니다.
extension ViewController: UIPickerViewDelegate {
    
    //UIPickerViewDelegate의 titleForRow 함수는 피커뷰에 각 row에 어떤 String이 들어가는지 설정하는 함수입니다.
    //여기서는 parts의 row에 따른 각 데이터들이 들어가게됩니다.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return parts[row]
    }
}

//피커뷰의 dataSource를 채택하는 extension 구문입니다.
extension ViewController: UIPickerViewDataSource {
    
    //UIPickerViewDataSource의 numberOfConponents 함수는 피커뷰의 컴포넌트 개수를 설정합니다.
    //피커뷰의 컴포넌트는 열(column)의 개수라고 생각하시면 이해가 빠릅니다.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //numberOfRowsInComponents 함수는 각 Component에 row가 몇개인지 설정합니다.
    //여기서는 parts의 데이터의 개수로 설정합니다.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return parts.count
    }
}














