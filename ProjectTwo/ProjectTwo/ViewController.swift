//
//  ViewController.swift
//  ProjectTwo
//
//  Created by Anish Kochhar on 13/03/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries += ["estonia", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        buttonOne.layer.borderWidth = 1
        buttonTwo.layer.borderWidth = 1
        buttonThree.layer.borderWidth = 1
        
        buttonOne.layer.borderColor = UIColor.lightGray.cgColor
        buttonTwo.layer.borderColor = UIColor.lightGray.cgColor
        buttonThree.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func updateScore(correct: String?) {
        if let correct = correct {
            title = correct + "               Score: \(score)"
        } else {
            title = "Final Score: \(score)"
        }
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        
        buttonOne.setImage(UIImage(named: countries[0]), for: .normal)
        buttonTwo.setImage(UIImage(named: countries[1]), for: .normal)
        buttonThree.setImage(UIImage(named: countries[2]), for: .normal)
        
//        title = countries[correctAnswer].uppercased() + "               Score: \(score)"
        updateScore(correct: countries[correctAnswer].uppercased())
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        questionsAsked += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong. That flag is \(countries[sender.tag].uppercased())!"
            score -= 1
        }
        
        if questionsAsked >= 10 {
            
            let ac = UIAlertController(title: "Finished", message: "Your final score was \(score)", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Finish", style: .destructive, handler: nil))
            
            present(ac, animated: true)
            
            updateScore(correct: nil)
            
            buttonOne.isEnabled = false
            buttonTwo.isEnabled = false
            buttonThree.isEnabled = false
            
        } else {
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "continue", style: .default, handler: askQuestion))
            
            present(ac, animated: true)
        }
        
        
    }
    
}

