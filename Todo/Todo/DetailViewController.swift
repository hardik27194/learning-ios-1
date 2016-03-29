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

    var todo: TodoModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        todoItem.delegate = self

        if let todoData = todo {
            navigationController?.title = "修改Todo"

            switch todoData.image {
            case "child-selected":
                childButton.selected = true
            case "phone-selected":
                phoneButton.selected = true
            case "shopping-cart-selected":
                shoppingCartButton.selected = true
            case "travel-selected":
                travelButton.selected = true
            default:
                resetButtons()
            }

            todoItem.text = todoData.title
            todoDate.date = todoData.date
        } else {
            childButton.selected = true
            navigationController?.title = "新增Todo"
        }
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
        if todo == nil {
            let imageName = getImageName()
            let id = getId()
            let todo = TodoModel(id: id, image: imageName!, title: todoItem.text!, date: todoDate.date)
            todos.append(todo)
        } else {
            todo?.image = getImageName()!
            todo?.title = todoItem.text!
            todo?.date = todoDate.date
        }
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
