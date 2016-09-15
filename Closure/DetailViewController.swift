//
//  DetailViewController.swift
//  Closure
//
//  Created by Chung on 9/15/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var Image: UIImageView!
    var contentItem: String!
    var imageItem: NSData!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        content.text = contentItem
        Image.image = UIImage(data: imageItem)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
