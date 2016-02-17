//
//  ViewController.swift
//  Quiz
//
//  Created by hongtao on 16/2/16.
//  Copyright © 2016年 floodliu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!

    let questions: [String] = ["你是谁？",
                               "你从哪里来？",
                               "你要到哪去？"]
    let answers: [String] = ["贫僧法号三藏",
                             "从东土大唐而来",
                             "去往西天拜佛求经"]

    var currentQuestionIndex: Int = 0

    @IBAction func showNextQuestion(sender: AnyObject) {
        ++currentQuestionIndex
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }

        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }

    @IBAction func showAnswer(sender: AnyObject) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
}

