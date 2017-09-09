//
//  FirstViewController.swift
//  tests
//
//  Created by iosdev on 9/2/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit




class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    var todoArray:[list]=[]
    
    func updateData(todoe: list){
    todoArray.append(todoe)
    }
 
    @IBOutlet weak var tableView: UITableView!
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    return todoArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
    
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! cellTableViewCell
        cell.actLabel.text = todoArray[indexPath.row].todo
        cell.timeLabel.text = todoArray[indexPath.row].dateandtime
        return (cell)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "segue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let new = segue.destination as! infoViewController

    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let secondNavController = tabBarController?.viewControllers?[1] as! SecondViewController
        secondNavController.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension FirstViewController: SecondViewControllerDelegate{
    func firstViewController(_controller: SecondViewController, didUpdateTodoes todoes: list) {
    
    }
}
