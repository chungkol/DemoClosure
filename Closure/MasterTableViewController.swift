//
//  MasterTableViewController.swift
//  Closure
//
//  Created by Chung on 9/15/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    var data: [Item] = []
    var arrData: [Data] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [Item(name: "Teresa Trần", image: "http://nld.vcmedia.vn/k:thumb_w/540/2016/teresa-tran-1469582144769/thi-sinh-hoa-hau-ban-sac-viet-do-suc-nong-bikini.JPG", SBD: "SBD 030", height: "1,75 m", weight: "55 kg", diagram: "81-62-91", content: "Teresa Trần (SBD 030) đến từ Mỹ là một gương mặt thí sinh quốc tế khá sáng, thậm chí nhiều người ví cô là bản sao của Hoa hậu Trương Tử Lâm. Teresa Trần có chiều cao 1,75 m, nặng 55 kg với số đo 3 vòng 81-62-91"),
                Item(name: "Võ Quỳnh Giao", image: "http://nld.vcmedia.vn/k:thumb_w/540/2016/vo-quynh-giao-2-1469582144826/thi-sinh-hoa-hau-ban-sac-viet-do-suc-nong-bikini.JPG", SBD: "SBD 016", height: "1,76 m", weight: "50 kg", diagram: "82-62-92.", content: "Võ Quỳnh Giao (SBD 016) đã trở nên khác lạ khi cô thể hiện bản thân trước ống kính trong trang phục bikini. Có chiều cao 1,76 m, nặng 50 kg, đôi chân thon dài giúp cho vóc dáng của Quỳnh Giao cực cân đối khi kết hợp với số đo 3 vòng khá hoàn mỹ là 82-62-92."),
                Item(name: "Bùi Thi Thảo Phương", image: "http://nld.vcmedia.vn/k:thumb_w/540/2016/bui-thi-thao-phuong-3-1469582685879/thi-sinh-hoa-hau-ban-sac-viet-do-suc-nong-bikini.JPG", SBD: "SBD 089", height: "1,81 m", weight: "60 kg", diagram: "81-64-95", content: "Bùi Thi Thảo Phương (SBD 089) là người đẹp có chiều cao nổi bật nhất trong dàn thí sinh trong nước. Cô cao 1,81 m, cân nặng 60 kg, số đo 3 vòng 81-64-95.") ,
                Item(name: "Trần Thị Thu Ngân", image: "http://nld.vcmedia.vn/k:thumb_w/540/2016/ho-thi-phuong-ngan-2-1-1469582443285/thi-sinh-hoa-hau-ban-sac-viet-do-suc-nong-bikini.JPG", SBD: "SBD 354", height: "1,70 m", weight: "49 kg", diagram: "87-59-92", content: "Trần Thị Thu Ngân (SBD 354) cao 1,70 m, nặng 49 kg, số đo 3 vòng 87-59-92. Hiện cô đang là sinh viên năm thứ nhất ngành quản trị khách sạn tại Thụy Sỹ.")]
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = NSBundle.mainBundle().loadNibNamed("ItemCell", owner: self, options: nil).first as! ItemCell
        let item: Item = data[indexPath.row]
        loadData({ (data) in
            dispatch_async(dispatch_get_main_queue(), {
                if(data.index == indexPath.row){
                     print("truoc \(data.index)")
                    self.arrData.append(data)
//                   
                    print(data.index)
                    cell.imageCell.image = UIImage(data: data.value)
                    cell.lbNameCell.text = item.name
                    cell.lbSBDCell.text = item.SBD
                    cell.lbHeightCell.text = item.height
                    cell.lbWeightCell.text = item.weight
                    cell.lbDiagramCell.text = item.diagram
                }
            })
            
        })
        
        return cell
    }
    
    func loadData(onSuccess: (data: Data) -> ()){
        dispatch_async(dispatch_get_global_queue(0, 0), {
            for i in 0..<self.data.count {
                if let url = NSURL(string: self.data[i].image){
                    if let result = NSData(contentsOfURL: url){
                        onSuccess(data: Data(value: result, index: i))
                    }
                    
                }
            }
        })
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("Detail") as! DetailViewController
        
        detailVC.contentItem = data[indexPath.row].content
        detailVC.imageItem = arrData[indexPath.row].value
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
    
    
}
class Data: NSObject {
    var value: NSData!
    var index: Int!
    init(value: NSData , index: Int) {
        self.value = value
        self.index = index
    }
}
