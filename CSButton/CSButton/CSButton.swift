//
//  CSButton.swift
//  CSButton
//
//  Created by 정의찬 on 2023/03/24.
//

import UIKit

// 버튼 타입을 결정하는 열거형

public enum CSButtonType{
    case rect
    case circle
}

class CSButton: UIButton {
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        
        // 스토리 방식으로 버튼을 정의했을 떄 적용
        self.backgroundColor = .green // 배경 그린
        self.layer.borderWidth = 2 // 테두리 두껍게
        self.layer.borderColor = UIColor.black.cgColor // 테두리 검은색
        self.setTitle("버튼", for: .normal)
        
    }
    
    convenience init(type: CSButtonType){
        self.init()
        
        switch type{
        case .rect:
            self.backgroundColor = .black
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 0 // 모서리는 둥글지 않게 한다
            self.setTitleColor(.white, for: .normal)
            self.setTitle("Rect Button", for: .normal)
            
        case .circle:
            self.backgroundColor = .red
            self.layer.borderColor = UIColor.blue.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 50 // 50만큼 둥글게 처리
            self.setTitle("Circle Button", for: .normal)
        }
        
        self.addTarget(self, action: #selector(counting(_:)), for: .touchUpInside)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.backgroundColor = .gray
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        self.setTitle("코드 버튼", for: .normal)
    }
    
    init(){
        super.init(frame: CGRect.zero)
    }
    
    var style: CSButtonType = .rect{
        didSet{
            switch style{
            case .rect:
                self.backgroundColor = .black
                self.layer.borderColor = UIColor.black.cgColor
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 0 // 모서리는 둥글지 않게 한다
                self.setTitleColor(.white, for: .normal)
                self.setTitle("Rect Button", for: .normal)
                
            case .circle:
                self.backgroundColor = .red
                self.layer.borderColor = UIColor.blue.cgColor
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 50 // 50만큼 둥글게 처리
                self.setTitle("Circle Button", for: .normal)
            }
        }
    }
    
    // 버튼이 클릭된 횟수를 카운트하여 타이틀에 표시해 주는 함수
    @objc func counting(_ sender: UIButton){
        sender.tag = sender.tag + 1
        sender.setTitle("\(sender.tag) 번째 클릭", for: .normal)
    }
}
