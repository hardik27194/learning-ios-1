//
//  ViewController.swift
//  Todo
//
//  Created by floodliu on 16/3/22.
//  Copyright © 2016年 floodliu. All rights reserved.
//

import UIKit

var todos = [TodoModel]()

func dateFromString(dateStr: String) -> NSDate? {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.dateFromString(dateStr)
    return date
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        todos = [
            TodoModel(id: "1", image: "child-selected", title: "1. 去游乐场", date: dateFromString("2014-11-02")!),
            TodoModel(id: "2", image: "shopping-cart-selected", title: "2. 购物", date: dateFromString("2014-10-28")!),
            TodoModel(id: "3", image: "phone-selected", title: "3. 打电话", date: dateFromString("2014-10-30")!),
            TodoModel(id: "4", image: "travel-selected", title: "4. 欧洲旅行", date: dateFromString("2014-10-31")!)
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell")
        let image = cell?.viewWithTag(101) as! UIImageView
        let title = cell?.viewWithTag(102)as! UILabel
        let date = cell?.viewWithTag(103) as! UILabel
        
        let todo = todos[indexPath.row]
        image.image = UIImage(named: todo.image)
        title.text = todo.title
        date.text = stringFromDate(todo.date)
        
        return cell!
    }
    
    func stringFromDate(date: NSDate) -> String {
        let locale = NSLocale.currentLocale()
        let dateFormatter = NSDateFormatter()
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("yyyy-MM-dd", options: 0, locale: locale)
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.stringFromDate(date)
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            todos.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
}
