//
//  MemoListVC.swift
//  MyMemory
//
//  Created by 정의찬 on 2023/03/03.
//

import UIKit

class MemoListVC: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

   
    /// 테이블 행의 개수를 결정하는 메서드
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.appDelegate.memoList.count
        return count
    }
    
    
    // 화면이 나타날 때마다 호출되는 메서드
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    
    // 테이블 행을 구성하는 메서드
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // memoList 배열 데이터에서 주어진 행에 맞는 데이터 꺼내기
        let row = self.appDelegate.memoList[indexPath.row]
        
        // 이미지가 비어있으면 왼쪽, 아니면 오른쪽 선택
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        
        // 재사용 큐로부터 프로포타이 셀의 읜스턴스 전달
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: cellId) as? MemoCell else { return UITableViewCell()}
        
        
        
        // memoCell의 내용 구성
        cell.subject?.text = row.title
        cell.contents?.text = row.contents
        cell.img?.image = row.image
        
        // date 타입의 날짜를 변경
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.regdate?.text = formatter.string(from: row.regdate!)
        
        // cell 객체를 리턴한다.
        return cell
    }
    
    
    /// 테이블 특정 행 선택되었을 떄, 선택된 행의 정보 indexPath에 담겨 전달
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // memoList 배열에서 선택된 데이터 꺼낸다
        let row = self.appDelegate.memoList[indexPath.row]
        
        // 상세화면 인스턴스 생성
      guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else {
           return
       }
        
        // 값 전달 후, 상세 화면으로 이동
        vc.param = row
        
        
        // 화면 이동 부분
        self.navigationController?.pushViewController(vc, animated: true)
        
      
        
    }
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
