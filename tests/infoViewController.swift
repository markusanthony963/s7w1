//
//  infoViewController.swift
//  tests
//
//  Created by iosdev on 9/2/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit

class infoViewController: UIViewController {
    
    var todosObject = ListM()
    
    
    @IBOutlet weak var infLabel: UILabel!

    @IBOutlet weak var taim: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        infLabel.text = todosObject.dateandtime
        taim.text = todosObject.todo
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
