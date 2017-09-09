//
//  FirstViewController.swift
//  tests
//
//  Created by iosdev on 9/2/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit

var list = [String]()

var indx = ""


class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

 
    @IBOutlet weak var tableView: UITableView!
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    return list.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
    
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! cellTableViewCell
        cell.actLabel.text = list[indexPath.row]
        cell.timeLabel.text = timeD
        return (cell)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indx = list[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let new = segue.destination as! infoViewController
        new.temp = indx
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
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

