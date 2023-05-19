//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    @IBOutlet var choiceOne: UIButton!
    @IBOutlet var choiceTwo: UIButton!
    @IBOutlet var choiceThree: UIButton!
    

    var quizBrain = QuizBrain()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        let questionChoices = quizBrain.getQuestionChoices()
        choiceOne.setTitle("\(questionChoices[0])", for: .normal)
        choiceTwo.setTitle("\(questionChoices[1])", for: .normal)
        choiceThree.setTitle("\(questionChoices[2])", for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score \(quizBrain.getScore())"
        choiceOne.backgroundColor = UIColor.clear
        choiceTwo.backgroundColor = UIColor.clear
        choiceThree.backgroundColor = UIColor.clear
    }
    
}

