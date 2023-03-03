//
//  MemoReadVC.swift
//  MyMemory
//
//  Created by 정의찬 on 2023/03/03.
//

import UIKit

class MemoReadVC: UIViewController {

    override func viewDidLoad() {
        
        
        //제목, 내용, 이미지 출력
        self.subject.text = param?.title
        self.contents.text = param?.contents
        self.img.image = param?.image
        
        // 날짜 포맷 변환
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 적용"
        let dateString = formatter.string(from: (param?.regdate)!)
        
        // 내비게이션 타이틀에 날짜 표시
        self.navigationItem.title = dateString
        

        // Do any additional setup after loading the view.
    }
    
    
    var param: MemoData?
    
    @IBOutlet weak var subject: UILabel!
    
    @IBOutlet weak var contents: UILabel!

     @IBOutlet weak var img: UIImageView!
    
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
