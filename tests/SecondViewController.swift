//
//  SecondViewController.swift
//  tests
//
//  Created by iosdev on 9/2/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit

var timeD = ""

class SecondViewController: UIViewController {

    @IBOutlet weak var input: UITextField!

    @IBAction func add(_ sender: AnyObject) {
        
        if(input.text != ""){
            dateShow()
            list.append(input.text!)
            input.text = ""
        }
        
    }
    
    
    func dateShow(){
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy - HH:mm"
        let result = formatter.string(from: date)
        timeD = result
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

