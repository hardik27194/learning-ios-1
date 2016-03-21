//
//  TodoModel.swift
//  Todo
//
//  Created by floodliu on 16/3/22.
//  Copyright © 2016年 floodliu. All rights reserved.
//

import UIKit

class TodoModel: NSObject {
    
    var id: String
    var image: String
    var title: String
    var date: NSDate
    
    init(id: String, image: String, title: String, date: NSDate) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
}