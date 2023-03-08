//
//  ViewController.swift
//  inputForm
//
//  Created by 정의찬 on 2023/03/08.
//

import UIKit

class ViewController: UIViewController {
    
    // 이메일 입력 필드
    var paramEmail: UITextField!
    // 스위치 객체
    var paramUpdate: UISwitch!
    //  스테퍼
    var paramInterval: UIStepper!
    
    // 스위치 컨트롤러 값 표시 레이블
    var txtUpdate: UILabel!
    
    // 스테퍼의 값을 텍스트로 표현할 레이블
    var txtInterval: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 네비게이션 바 타이틀 생성
        self.navigationItem.title = "setup"
        
        // 커스텀 폰트
        let customFont = UIFont(name: "GamjaFlower-Regular", size: 16)
        
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 100, width: 100 , height: 30)
        lblEmail.text = "이메일"
        // 레이블 폰트 설정
        lblEmail.font = UIFont.systemFont(ofSize: 14)
        lblEmail.font = customFont
        
        // 레이블 루트 뷰에 추가한다
        self.view.addSubview(lblEmail)
        
        // 자동갱신 레이블을 생성하고 루트 뷰에 추가한다.
        let lblUpdate = UILabel()
        lblUpdate.frame = CGRect(x: lblEmail.frame.origin.x, y: lblEmail.frame.origin.y + 50, width: 100, height: 30)
        lblUpdate.text = "자동 버튼"
        lblUpdate.font = UIFont.systemFont(ofSize: 14)
        lblUpdate.font = customFont
        
        self.view.addSubview(lblUpdate)
        
        // 갱신주기 레이블을 주기적으로 생성한다.
        let lblInerval = UILabel()
        lblInerval.frame = CGRect(x: lblEmail.frame.origin.x, y: lblEmail.frame.origin.y + 100, width: 100, height: 30)
        lblInerval.text = "갱신주기"
        lblInerval.font = UIFont.systemFont(ofSize: 14)
        lblInerval.font = customFont
        
        self.view.addSubview(lblInerval)
        
        // 입력을 위한 텍스트 필드 추가
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.borderStyle = .roundedRect
        self.paramEmail.placeholder = "input your email"
        self.paramEmail.autocapitalizationType = .none
        
        self.view.addSubview(self.paramEmail)
        
        // 스위치 객체를 생성한다
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: paramEmail.frame.origin.x, y: paramEmail.frame.origin.y + 50, width: 50, height: 30)
        
        // 스위치가 on 되어 있는 상태를 기본값으로 설정한다.
        self.paramUpdate.setOn(true, animated: true)
        
        self.view.addSubview(self.paramUpdate)
        
        // 갱신주기를 위한 스테퍼 추가한다.
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: paramEmail.frame.origin.x, y: paramEmail.frame.origin.y + 100, width: 50, height: 30)
        self.paramInterval.minimumValue = 0 // 스테퍼가 가지는 최소값
        self.paramInterval.maximumValue = 100 // 스테퍼가 가지는 최댓값
        self.paramInterval.stepValue = 1 // 스테퍼 값 변경 단위
        self.paramInterval.value = 0 // 초기값 설정
        
        self.view.addSubview(self.paramInterval)
        
        // 스위치 객체의 값 표현 레이블
        self.txtUpdate = UILabel()
        self.txtUpdate.frame = CGRect(x: paramEmail.frame.origin.x + 130, y: 150, width: 100, height: 30)
        self.txtUpdate.font = UIFont.systemFont(ofSize: 12)
        self.txtUpdate.textColor = UIColor.red // text 색상 설정
        self.txtUpdate.text = "갱신함" // 갱신 or 미갱신 업뎃
        
        self.view.addSubview(self.txtUpdate)
        
        // 스테퍼 값 텍스트로 표현
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: txtUpdate.frame.origin.x, y: txtUpdate.frame.origin.y + 50, width: 100, height: 30)
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = UIColor.red
        self.txtInterval.text = "0분마다"
        
        self.view.addSubview(self.txtInterval)
        
        // 스위치와 스테퍼 컨트롤러의 value 이벤트를 액션 메소드에 연결
        self.paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .valueChanged)
        
        self.paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
        
        let submintBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
        self.navigationItem.rightBarButtonItem = submintBtn
    }
    
    // 스위치와 상호작용
    @objc func presentUpdateValue(_ sender: UISwitch){
        self.txtUpdate.text = (sender.isOn == true ? "갱신함" : "갱산하지 않음")
    }
    
    // 스테퍼와 상호작용
    @objc func presentIntervalValue(_ sender: UIStepper){
        self.txtInterval.text = ("\(Int(sender.value))분마다")
    }
    
    @objc func submit(_ sender: Any){
        let rvc = ReadViewController()
        rvc.pEmail = self.paramEmail.text
        rvc.pUpdate = self.paramUpdate.isOn
        rvc.pInterval = self.paramInterval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
}

