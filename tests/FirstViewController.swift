//
//  FirstViewController.swift
//  tests
//
//  Created by iosdev on 9/2/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit
import RealmSwift



class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    var todoArray = List<ListM>()
    var realm: Realm!
    
    
    func updateData(todoe: ListM){
    let realm = try! Realm()
        try! realm.write{
            todoArray.insert(todoe, at: todoArray.count)
            realm.add(todoe)
        }
      tableView.reloadData()
        
        
    }
 
    @IBOutlet weak var tableView: UITableView!
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
    return todoArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
    
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! cellTableViewCell
    let todoRealm = todoArray[indexPath.row]
        cell.actLabel.text = todoArray[indexPath.row].todo
        cell.timeLabel.text = todoArray[indexPath.row].dateandtime
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete"){(action,indexPath) in
            try! self.realm.write{
            let list = self.todoArray[indexPath.row]
                    self.realm.delete(list)
            }
            self.todoArray.remove(at: indexPath.row)
            tableView.reloadData()
            self.prepareTable()
        
        
        }
        return [deleteAction]
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "segue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let new = segue.destination as! infoViewController

    }
    
    override func viewDidAppear(_ animated: Bool) {
        prepareTable()
    }
    
    
    func prepareTable(){
    
        if todoArray.count < 1{
            tableView.isHidden = true
        }else {
        tableView.isHidden = false
        }
    }
    
    
    
    
    
    func loadDataRealm(){
    self.realm = try! Realm()
        let lists = realm.objects(ListM.self)
        if self.todoArray.realm == nil, lists.count > 0{
            for list in lists{
            self.todoArray.append(list)
            }
        }
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let secondNavController = tabBarController?.viewControllers?[1] as! SecondViewController
        secondNavController.delegate = self
        loadDataRealm()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension FirstViewController: SecondViewControllerDelegate{
    func firstViewController(_controller: SecondViewController, didUpdateTodoes todoes: ListM) {
    updateData(todoe: todoes)
    }
}
