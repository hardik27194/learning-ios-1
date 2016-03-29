//
//  DetailViewController.swift
//  Todo
//
//  Created by hongtao on 16/3/29.
//  Copyright © 2016年 floodliu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var shoppingCartButton: UIButton!
    @IBOutlet weak var travelButton: UIButton!

    @IBOutlet weak var todoItem: UITextField!
    @IBOutlet weak var todoDate: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        todoItem.delegate = self
    }

    @IBAction func childTapped(sender: AnyObject) {
        resetButtons()
        childButton.selected = true
    }

    @IBAction func phoneTapped(sender: AnyObject) {
        resetButtons()
        phoneButton.selected = true
    }

    @IBAction func shoppingCartTapped(sender: AnyObject) {
        resetButtons()
        shoppingCartButton.selected = true
    }

    @IBAction func travelTapped(sender: AnyObject) {
        resetButtons()
        travelButton.selected = true
    }

    func resetButtons() {
        childButton.selected = false
        phoneButton.selected = false
        shoppingCartButton.selected = false
        travelButton.selected = false
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        todoItem.resignFirstResponder()
    }

    @IBAction func okTapped(sender: AnyObject) {
        let imageName = getImageName()
        let id = getId()
        let todo = TodoModel(id: id, image: imageName!, title: todoItem.text!, date: todoDate.date)
        todos.append(todo)
    }

    func getImageName() -> String? {
        if childButton.selected {
            return "child-selected"
        } else if phoneButton.selected {
            return "phone-selected"
        } else if shoppingCartButton.selected {
            return "shopping-cart-selected"
        } else if travelButton.selected {
            return "travel-selected"
        } else {
            return nil
        }
    }

    func getId() -> String {
        return NSUUID().UUIDString
    }
}
