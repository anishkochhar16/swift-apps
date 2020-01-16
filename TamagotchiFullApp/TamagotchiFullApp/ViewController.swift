//
//  ViewController.swift
//  TamagotchiFullApp
//
//  Created by Kochhar, Anish (EJNR) on 14/01/2020.
//  Copyright © 2020 Kochhar, Anish (EJNR). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var InformationLabel: UILabel!
    @IBOutlet weak var TamagotchiLabel: UILabel!
    @IBOutlet weak var mealButton: UIButton!
    @IBOutlet weak var snackButton: UIButton!
    @IBOutlet weak var gameButton: UIButton!
    @IBOutlet weak var toiletButton: UIButton!
    @IBOutlet weak var medicineButton: UIButton!
    @IBOutlet weak var disciplineButton: UIButton!
    @IBOutlet weak var LifetimeLabel: UILabel!
    @IBOutlet weak var RockButton: UIButton!
    @IBOutlet weak var PaperButton: UIButton!
    @IBOutlet weak var ScissorsButton: UIButton!
    
    var timer: Timer?
    var lifetime = 0
    var choice = 0
    
    var tamagotchi: Tamagotchi? {
        didSet {
                TamagotchiLabel.text = tamagotchi?.showStats()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tamagotchi = Tamagotchi(name: "Samuel")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        RockButton.isHidden = true
        PaperButton.isHidden = true
        ScissorsButton.isHidden = true

    }
    @IBAction func mealButton(_ sender: Any) {
        InformationLabel.text = """
        Hunger Reset to 0
        Weight Increased by 1
        """
        tamagotchi?.feedMeal()
        checkIfDead()
        displayStats()
    }
    
    @IBAction func snackButton(_ sender: Any) {
        InformationLabel.text = """
        Happiness Increased by 1
        Weight increasing by 2
        """
        tamagotchi?.feedSnack()
        // add way to die if eat too many snacks
        checkIfDead()
        displayStats()
    }
    
    @IBAction func gameButton(_ sender: Any) {
        tamagotchi?.playGame()
        hideGameButtons()
        InformationLabel.text = """
        Choose Rock, Paper or Scissors
        """
        choice = Int.random(in: 1...3)
    }
    @IBAction func toiletBathroom(_ sender: Any) {
    }
    @IBAction func medicineButton(_ sender: Any) {
    }
    @IBAction func disciplineButton(_ sender: Any) {
    }
    
    func displayStats() {
        TamagotchiLabel.text = tamagotchi?.showStats()
    }
    func checkIfDead() -> Bool {
        if ((tamagotchi?.getWeight())!) >= 15 {
            InformationLabel.text = "Your Tamagotchi has got too heavy and died!!"
            return true
        } else if ((tamagotchi?.getWeight())!) <= 0 {
            InformationLabel.text = "Your Tamagotchi has got too light and died!"
            return true
        }
        else {
            return false
        }
    }
    
    @IBAction func rockButtonAction(_ sender: Any) {
        // userChoice = 1
        if choice == 1 {
            InformationLabel.text = "Draw"
        } else if choice == 2 {
            InformationLabel.text = "Loss, the computer chose Paper"
        } else if choice == 3 {
            InformationLabel.text = "Won, the computer chose Scissors"
        }
        hideGameButtons()
    }
    @IBAction func paperButtonAction(_ sender: Any) {
//        userChoice = 2
        if choice == 2 {
            InformationLabel.text = "Draw"
        } else if choice == 1 {
            InformationLabel.text = "Won, the computer chose Rock"
        } else if choice == 3 {
            InformationLabel.text = "Loss, the computer chose Scissors"
        }
        hideGameButtons()
    }
    @IBAction func scissorsButtonAction(_ sender: Any) {
//        userChoice = 3
        if choice == 3 {
            InformationLabel.text = "Draw"
        } else if choice == 1 {
            InformationLabel.text = "Loss, the computer chose Rock"
        } else if choice == 2 {
            InformationLabel.text = "Won, the computer chose Paper"
        }
        hideGameButtons()
    }
    
    func hideGameButtons() {
        if RockButton.isHidden == false {
            RockButton.isHidden = true
            PaperButton.isHidden = true
            ScissorsButton.isHidden = true
        } else {
            RockButton.isHidden = false
            PaperButton.isHidden = false
            ScissorsButton.isHidden = false
        }
    }
    
    @objc func countdown() {
        if (!checkIfDead()) {
            lifetime += 1
            LifetimeLabel.text = "\(lifetime)"
        } else {
            timer?.invalidate()
            mealButton.isEnabled = false
            snackButton.isEnabled = false
            gameButton.isEnabled = false
            toiletButton.isEnabled = false
            disciplineButton.isEnabled = false
            medicineButton.isEnabled = false
        }
    }
}

