//
//  CSStepper.swift
//  CSSStepper
//
//  Created by 정의찬 on 2023/03/24.
//

import UIKit
@IBDesignable

class CSStepper: UIControl {
    
    public var leftBtn = UIButton(type: .system) //좌측 버튼
    public var rightBtn = UIButton(type: .system) //우측 버튼
    public var centerLabel = UILabel() //중앙레이블
    @IBInspectable
    public var stepValue: Int = 1
    public var maximumValue:Int = 100
    public var minumumValue: Int = -100
    @IBInspectable
    public var value: Int = 0{
        didSet{
            self.centerLabel.text = String(value)
            
            // 이 클래스를 사용하는 객체들에게 valueChanged 이벤트 신호를 호출한다.
            self.sendActions(for: .valueChanged)
        }
    } //현재값
    
    // 좌측 버튼타이틀 속성
    @IBInspectable
    public var leftTitle:String = "감소"{
        didSet{
            self.leftBtn.setTitle(self.leftTitle, for: .normal)
        }
    }
    
    // 우측 버튼 타이틀 속성
    @IBInspectable
    public var rightTitle:String = "증가"{
        didSet{
            self.rightBtn.setTitle(self.rightTitle, for: .normal)
        }
    }
    
    // 선택 영역 색상
    @IBInspectable
    public var bgColor: UIColor = UIColor.cyan{
        didSet{
            self.centerLabel.backgroundColor = backgroundColor
        }
    }
    
    //증감값 단위
 
        

   // 스토리보드 호출할 초기화 메서드
    public required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // 프로그래밍 방식으로 호출할 초기화 메소드
    public override init(frame: CGRect){
        super.init(frame: frame)
        self.setup()
    }
    
    private func setup(){
        
        let borderWidth: CGFloat = 0.5
        let borderColor = UIColor.blue.cgColor
        
        self.leftBtn.tag = -1  // 태그값 -1 부여
        self.leftBtn.setTitle(self.leftTitle, for: .normal) // 버튼 타이틀
        self.leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // 버튼 타이틀의 폰트
        
        self.leftBtn.layer.borderWidth = borderWidth //버튼 테두리 두꼐
        self.leftBtn.layer.borderColor = borderColor // 버튼 테두리 색상 - 파란색
        
        self.rightBtn.tag = 1
        self.rightBtn.setTitle(self.rightTitle, for: .normal) // 버튼 타이틀
        self.rightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        self.rightBtn.layer.borderWidth = borderWidth
        self.rightBtn.layer.borderColor = borderColor
        
        //중앙 레이블 속성
        
        self.centerLabel.text = String(value) // 컨트롤의 현재값을 문자열로 변환하여 표시
        self.centerLabel.font = UIFont.systemFont(ofSize: 16)
        self.centerLabel.textAlignment = .center
        self.centerLabel.backgroundColor = self.bgColor
        self.centerLabel.layer.borderWidth = borderWidth
        self.centerLabel.layer.borderColor = borderColor
        
        self.addSubview(self.leftBtn)
        self.addSubview(self.rightBtn)
        self.addSubview(self.centerLabel)
        
        self.leftBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        self.rightBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
    }
    
    @objc public func valueChange(_ sender: UIButton){
        
        
        let sum = self.value + (sender.tag * self.stepValue)
        if sum > self.maximumValue{
            return
        }
        if sum < self.minumumValue{
            return
        }
        self.value += (sender.tag * self.stepValue)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        let btnwidth = self.frame.height
        
        let lblwidth = self.frame.width - (btnwidth * 2)
        
        self.leftBtn.frame = CGRect(x: 0, y: 0, width: btnwidth, height: btnwidth)
        self.centerLabel.frame = CGRect(x: btnwidth, y: 0, width: lblwidth, height: btnwidth)
        self.rightBtn.frame = CGRect(x: btnwidth + lblwidth, y: 0, width: btnwidth, height: btnwidth)
    }
    
}
