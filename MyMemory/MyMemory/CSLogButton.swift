//
//  CSLogButton.swift
//  MyMemory
//
//  Created by 정의찬 on 2023/03/24.
//

import UIKit

public enum CSLogType:Int {
    case basic // 기본 로그 타입
    case title // 버튼의 타이틀을 출력
    case tag // 버튼의 태그값 출력
}

public class CSLogButton: UIButton {

    public var logType: CSLogType = .basic
    
    public required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        // 버튼에 스타일 적용
        self.setBackgroundImage(UIImage(named:"button-bg.png"), for: .normal)
        self.tintColor = .white
        
        self.addTarget(self, action: #selector(logging(_:)), for: .touchUpInside)
        
    }
    
    @objc func logging(_ sender: UIButton){
        switch self.logType {
        case .basic:
            NSLog("click")
        case .title:
            let btnTitle = sender.titleLabel?.text ?? "no text"
            NSLog("\(btnTitle) click")
        case .tag:
            NSLog("\(sender.tag) click")
        }
    }
    
}
