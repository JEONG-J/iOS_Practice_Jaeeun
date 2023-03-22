//
//  MapKitController.swift
//  Alert
//
//  Created by 정의찬 on 2023/03/22.
//

import UIKit
import MapKit

class MapKitController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapkitView = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.view = mapkitView
        self.preferredContentSize.height = 200
        
        // 표시할 위치
        let pos = CLLocationCoordinate2D(latitude: 37.51433, longitude: 126.894623)
        
        // 지도가 보여줄 넓이. 일종의 추적. 숫자가 작을수록 좁은 범위를 확장시켜서 보여준다.
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        // 지도 영역을 정의
        let region = MKCoordinateRegion(center: pos, span: span)
        
        // 영역을 지도 뷰에 표시
        mapkitView.region = region
        mapkitView.regionThatFits(region)
        
        // 위치를 핀으로 표시
        let point = MKPointAnnotation()
        point.coordinate = pos
        mapkitView.addAnnotation(point)
        
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
