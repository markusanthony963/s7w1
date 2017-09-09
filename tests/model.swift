//
//  model.swift
//  tests
//
//  Created by iosdev on 9/9/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import Foundation

class list{

    var todo = ""
    var dateandtime = ""
    
    init(){
    }
    
    init(todo:String,dateandtime: String){
    self.todo = todo
        self.dateandtime=dateandtime
    }
}
