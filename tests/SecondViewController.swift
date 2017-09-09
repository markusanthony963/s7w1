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
    var delegate: SecondViewControllerDelegate?
    @IBOutlet weak var input: UITextField!

    @IBAction func add(_ sender: AnyObject) {
        
        func dateShow(){
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMM yyyy - HH:mm"
            
            
            let result = formatter.string(from: date)
            let tempTodo = list(todo: (input.text!),dateandtime: result)
            self.delegate?.firstViewController(_controller: self, didUpdateTodoes: tempTodo)
            
            
            
            
            
            //todoArray.append(tempTodo)
            input.text = ""
            self.view.endEditing(true)
            tabBarController!.selectedIndex = 0
            
            
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


protocol SecondViewControllerDelegate{
    func firstViewController(_controller: SecondViewController,didUpdateTodoes todoes: list)
}
