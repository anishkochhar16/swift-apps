//
//  ViewController.swift
//  TamagotchiFullApp
//
//  Created by Kochhar, Anish (EJNR) on 14/01/2020.
//  Copyright © 2020 Kochhar, Anish (EJNR). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var tamagotchiLabel: UILabel!
    @IBOutlet weak var mealButton: UIButton!
    @IBOutlet weak var snackButton: UIButton!
    @IBOutlet weak var gameButton: UIButton!
    @IBOutlet weak var toiletButton: UIButton!
    @IBOutlet weak var medicineButton: UIButton!
    @IBOutlet weak var disciplineButton: UIButton!
    @IBOutlet weak var lifetimeLabel: UILabel!
    @IBOutlet weak var RockButton: UIButton!
    @IBOutlet weak var PaperButton: UIButton!
    @IBOutlet weak var ScissorsButton: UIButton!
    @IBOutlet weak var Poop1: UILabel!
    @IBOutlet weak var Poop2: UILabel!
    @IBOutlet weak var Poop3: UILabel!
    
    
    var timer: Timer?
    var lifetime = 0
    var choice = 0
    
    var tamagotchi: Tamagotchi? {
        didSet {
                tamagotchiLabel.text = tamagotchi?.showStats()
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
        informationLabel.text = """
        Hunger Reset to 0
        Weight Increased by 1
        """
        tamagotchi?.feedMeal()
        checkIfDead()
        displayStats()
    }
    
    @IBAction func snackButton(_ sender: Any) {
        informationLabel.text = """
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
        informationLabel.text = """
        Choose Rock, Paper or Scissors
        """
        choice = Int.random(in: 1...3)
    }
    @IBAction func toiletBathroom(_ sender: Any) {
        if (Poop1.isHidden == false) || (Poop2.isHidden == false) ||  (Poop3.isHidden == false) {
            hidePoops()
            informationLabel.text  = """
            Congratulations, you cleared your Tamagotchi's Poop!
            Its discipline and happiness have increased by 2!
            """
            tamagotchi?.doPoop()
            displayStats()
        } else {
            informationLabel.text = "Error, your Tamagotchi has not gone to the toilet!"
        }
    }
    @IBAction func medicineButton(_ sender: Any) {
    }
    @IBAction func disciplineButton(_ sender: Any) {
        if (tamagotchi?.getDis())! >= 0 {
            informationLabel.text = "Well done! Your Tamagotchi is more disclipined"
            tamagotchi!.addDis()
        }
    }
    
    func displayStats() {
        tamagotchiLabel.text = tamagotchi?.showStats()
    }
    func checkIfDead() -> Bool {
        if ((tamagotchi?.getWeight())!) >= 15 {
            informationLabel.text = "Your Tamagotchi has got too heavy and died!!"
            return true
        } else if ((tamagotchi?.getWeight())!) <= 0 {
            informationLabel.text = "Your Tamagotchi has got too light and died!"
            return true
        } else if ((tamagotchi?.getHealth())!) <= 0 {
            informationLabel.text = "He has died from too low health"
            return true
        } else if ((tamagotchi?.getHappy())! < 0) {
            informationLabel.text = "He has died from lack of happiness"
            return true
        }
        else {
            return false
        }
    }
    
    func displayPoop() {
        let loseHealthLabel = """
        Your Tamagotchi has shat himself, and lost 5 health!
        """
        let random_int = Int.random(in: 1...3)
        if random_int == 1 {
            if Poop1.isHidden == false {
                // Already On, so lose health
                tamagotchi?.loseHealth()
                informationLabel.text = loseHealthLabel
                displayStats()
            }
            Poop1.isHidden = false
        } else if random_int == 2 {
            if Poop2.isHidden == false {
                tamagotchi?.loseHealth()
                informationLabel.text = loseHealthLabel
                displayStats()
            } else {
                Poop2.isHidden = false
            }
        } else if random_int == 3 {
            if Poop3.isHidden == false {
                tamagotchi?.loseHealth()
                informationLabel.text = loseHealthLabel
                displayStats()

            } else {
                Poop3.isHidden = false
            }
        }
    }
    
    @IBAction func rockButtonAction(_ sender: Any) {
        // userChoice = 1
        if choice == 1 {
            informationLabel.text = "Draw"
            tamagotchi?.makeHappyOne()
        } else if choice == 2 {
            informationLabel.text = "Loss, the computer chose Paper"
            tamagotchi?.makeHappyOne()
        } else if choice == 3 {
            informationLabel.text = "Won, the computer chose Scissors"
            tamagotchi?.makeHappyTwo()
        }
        hideGameButtons()
        displayStats()
    }
    @IBAction func paperButtonAction(_ sender: Any) {
//        userChoice = 2
        if choice == 2 {
            informationLabel.text = "Draw"
            tamagotchi?.makeHappyOne()
        } else if choice == 1 {
            informationLabel.text = "Won, the computer chose Rock"
            tamagotchi?.makeHappyTwo()
        } else if choice == 3 {
            informationLabel.text = "Loss, the computer chose Scissors"
            tamagotchi?.makeHappyOne()
        }
        hideGameButtons()
        displayStats()

    }
    @IBAction func scissorsButtonAction(_ sender: Any) {
//        userChoice = 3
        if choice == 3 {
            informationLabel.text = "Draw"
            tamagotchi?.makeHappyOne()
        } else if choice == 1 {
            informationLabel.text = "Loss, the computer chose Rock"
            tamagotchi?.makeHappyOne()
        } else if choice == 2 {
            informationLabel.text = "Won, the computer chose Paper"
            tamagotchi?.makeHappyTwo()
        }
        hideGameButtons()
        displayStats()
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
    
    func hidePoops() {
        Poop1.isHidden = true
        Poop2.isHidden = true
        Poop3.isHidden = true
    }
    func die() {
        timer?.invalidate()
        mealButton.isEnabled = false
        snackButton.isEnabled = false
        gameButton.isEnabled = false
        toiletButton.isEnabled = false
        disciplineButton.isEnabled = false
        medicineButton.isEnabled = false
    }
    
    @objc func countdown() {
        if (!checkIfDead()) {
            lifetime += 1
            lifetimeLabel.text = "\(lifetime)"
            if (lifetime % 10 == 0) {
                let randomEvent = Int.random(in: 1...20)
                if randomEvent < 5 {
                    displayPoop()
                } else if (randomEvent < 10) && ((tamagotchi?.getDis())! > 0) {
                    tamagotchi!.removeDis()
                    displayStats()
                    informationLabel.text = "Your Tamagotchi is rioting! Discipline them!"
                } else if randomEvent < 14 {
                    informationLabel.text = "Random Event"
                } else if randomEvent < 19 {
                    informationLabel.text = "Random Event"
                } else {
                    informationLabel.text = "Your Tamagotchi has Died randomly"
                    die()
                }
                tamagotchi?.Age()
                displayStats()
            }
        } else {
            die()
        }
    }
}

