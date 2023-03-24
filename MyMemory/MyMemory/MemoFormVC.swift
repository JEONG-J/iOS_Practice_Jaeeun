//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by 정의찬 on 2023/03/03.
//

import UIKit

class MemoFormVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate {

    
    let picker = UIImagePickerController() // 인스턴스 생성

    override func viewDidLoad() {
        
        self.Contents.delegate = self
        
        let gbImage = UIImage(named: "memo-background@2x.png")!
        self.view.backgroundColor = UIColor(patternImage: gbImage)
        
        super.viewDidLoad()
        
        picker.delegate = self
        picker.allowsEditing = true

        // Do any additional setup after loading the view.
        
        self.Contents.layer.borderWidth = 0
        self.Contents.layer.borderColor = UIColor.clear.cgColor
        self.Contents.backgroundColor = UIColor.clear
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 9
        self.Contents.attributedText = NSAttributedString(string: " ", attributes: [.paragraphStyle: style])
        
        self.Contents.text = " "
    }
    
    
    var subject: String!
    
    // 메모장 변수
    @IBOutlet var Contents: UITextView!
    // 사진 미리보기 변수
    @IBOutlet var preview: UIImageView!
    
    // 저장 버튼
    @IBAction func save(_ sender: Any) {
        let alertV = UIViewController()
        let iconImage = UIImage(named: "warning-icon-60@2x.png")
        alertV.view = UIImageView(image: iconImage)
        alertV.preferredContentSize = iconImage?.size ?? CGSize.zero
        // 내용입력 안하면 경고한다.
        guard self.Contents.text?.isEmpty == false else{
            let alert = UIAlertController(title:nil, message: "내용을 입력해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.setValue(alertV, forKey: "contentViewController")
            self.present(alert, animated: true)
            return
        }
        
        //MemoData 객체 생성 -> 데이터 담기
        let data = MemoData()
        
        data.title = self.subject // 제목
        data.contents = self.Contents.text // 내용
        data.image = self.preview.image // 이미지
        data.regdate = Date() // 작성 시각
        
        // 객체를 읽어오고, memoList 배열에 MemoData 객체 추가
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memoList.append(data)
        
        // 화면 종료 후 이전으로 돌아간다.
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    // 카메라 버튼
    @IBAction func pick(_ sender: Any) {
        
        let alert = UIAlertController(title: "선택", message: "이미지 가져올 곳 고르세요", preferredStyle: .actionSheet)
        
        let library = UIAlertAction(title: "저장앨범", style: .default) { (action) in self.PhotoAlbum()}
        let camera = UIAlertAction(title: "카메라", style: .default) { (action) in self.CameraAction()}
        let album = UIAlertAction(title: "사진 라이브러리", style: .default){ (action) in self.SaveAlbum()}
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(album)
        
       
        
        present(alert, animated: false)
        
    }
    // 카메라 버튼 시 선택 할 알터 옵션
    func PhotoAlbum(){
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion:  nil)
    }
    // 카메라 버튼 시 선택 할 알터 옵션
    func CameraAction(){
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            present(picker, animated: true, completion: nil)
        }
        else{
            print("camera not aliable")
        }
    }
        // 카메라 버튼 시 선택 할 알터 옵션
    func SaveAlbum(){
        picker.sourceType = .savedPhotosAlbum
        present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.preview.image = info[.editedImage] as? UIImage
        
        // 이미지 피커 컨트롤러를 닫는다.
        picker.dismiss(animated: false)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let contents = textView.text as NSString
        let length = ( (contents.length > 15) ? 15 : contents.length)
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        
        self.navigationItem.title = self.subject
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let bar = self.navigationController?.navigationBar
        
        let ts = TimeInterval(0.3)
        UIView.animate(withDuration: ts){
            bar?.alpha = ( bar?.alpha == 0 ? 1 : 0)
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
