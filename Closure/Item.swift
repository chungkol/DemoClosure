//
//  Item.swift
//  Closure
//
//  Created by Chung on 9/15/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import Foundation
class Item: AnyObject {
    var name: String!
    var image: String!
    var SBD : String!
    var height : String!
    var weight: String!
    var diagram: String!
    var content: String!
    
    init(name: String, image: String , SBD: String, height: String , weight: String , diagram: String, content: String  ){
        self.name = name
        self.image = image
        self.SBD = SBD
        self.height = height
        self.weight = weight
        self.diagram = diagram
        self.content = content
    }
}
