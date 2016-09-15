//
//  ViewController.swift
//  Closure
//
//  Created by Chung on 9/15/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imgs = ["http://kenh14cdn.com/thumb_w/600/2016/img-0167-1458022408738.jpg",
                "http://media.baotinnhanh.vn/js/tiny_mce/plugins/imagemanager/files/123/hoa-hau-hoan-vu-viet-nam-2.jpg",
                "http://eva-img.24hstatic.com/upload/3-2016/images/2016-07-13/5-nguoi-dep-sang-gia-nhat-khu-vuc-mien-bac-hhvn-2016-h1-1468387679-width500height750.jpg",
                "http://images.vov.vn/w600/uploaded/ssfgmuyzqkvcik6y7e4paw/2016_06_12/3_SBD_255_Tran_Thi_Thuy_Trang_RVEO.JPG",
                "https://vtv1.vcmedia.vn/k:2016/sbd068-ougl-1468913953880/thi-nguoi-dep-bien-top-36-hoa-hau-viet-nam-2016-khoe-sac-voc-nuot-na.jpg"]
    
    //khai báo 1 block
    var block1: ((p1: Int, p2: String) -> Int)?
    
    //cách 2
    var block2 = {(p1: Int) -> () in
        print(p1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        block1!(p1: 1, p2: "abc")
//        block2(9999)
        printSomething(9, completion: {() in
            print("Đã hoàn thành")
        })
    }
    func printSomething(p1: Int, completion:() -> () ){
        print(p1)
        completion()
    }
    
    func loadData(completion:(data: NSData , index: Int) -> ()){
        
        dispatch_async(dispatch_get_global_queue(0, 0), {
            for stringURL in self.imgs
            {
                if let url = NSURL(string: stringURL) {
                    if let data = NSData(contentsOfURL: url){
                        completion(data: data, index: self.imgs.indexOf(stringURL)!)
                    }
                }
            }
        })
       
    }
    @IBAction func a_Load(sender: AnyObject){
        loadData({ (data, index) in
            dispatch_async(dispatch_get_main_queue(), {
                if let imgView = self.view.viewWithTag(100 + index) as? UIImageView
                {
                    imgView.image = UIImage(data: data)
                }
            })
            
            
            
            
        })
    }
    @IBAction func a_Print(sender: AnyObject){
        print("TechMaster")
    }


}

