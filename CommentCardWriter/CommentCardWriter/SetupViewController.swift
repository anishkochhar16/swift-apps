//
//  SetupViewController.swift
//  CommentCardWriter
//
//  Created by Kochhar, Anish (EJNR) on 11/02/2020.
//  Copyright © 2020 Kochhar, Anish (EJNR). All rights reserved.
//

import UIKit

class SetupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var division: Division
    let numbers = [1, 2, 3, 4, 5]
    @IBOutlet weak var effortPicker: UIPickerView!
    @IBOutlet weak var enjoymentPicker: UIPickerView!
    @IBOutlet weak var ewStrengthSwitch: UISwitch!
    @IBOutlet weak var attitudeSwitch: UISwitch!
    @IBOutlet weak var goodSwitch: UISwitch!
    @IBOutlet weak var ewWeaknessSwitch: UISwitch!
    @IBOutlet weak var involvedMoreSwitch: UISwitch!
    @IBOutlet weak var disorganisedSwitch: UISwitch!
    @IBOutlet weak var confirmButton: UIButton!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(numbers[row])
    }
    
    init?(coder: NSCoder, division: Division) {
        self.division = division
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Setup: \(division.code)"
        enjoymentPicker.dataSource = self
        enjoymentPicker.delegate = self
        effortPicker.delegate = self
        effortPicker.dataSource = self
    }

    func initializeOpinion () {
        var opinion = Opinion(strengths: [], weaknesses: [], effort: 0, enjoyment: 0, division: self.division)
        if self.attitudeSwitch.isOn {
            opinion.strengths.append("attitude")
        }
        if self.ewStrengthSwitch.isOn {
            opinion.strengths.append("EW")
        }
        if self.goodSwitch.isOn {
            opinion.strengths.append("good")
        }
        if self.disorganisedSwitch.isOn {
            opinion.weaknesses.append("disorganised")
        }
        if self.ewWeaknessSwitch.isOn {
            opinion.weaknesses.append("EW")
        }
        if self.involvedMoreSwitch.isOn {
            opinion.weaknesses.append("involved")
        }
        self.division.opinion = opinion
    }
    
    @IBAction func confirmChoices(_ sender: Any) {
        let alert = UIAlertController(title: "confirm", message: "Are you sure", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        alert.addAction(UIAlertAction(title: "yes im sure", style: .default, handler: { action in
            // Create New Opinion
            self.initializeOpinion()
            guard let vc = self.storyboard?.instantiateViewController(identifier: "DisplayScreenViewController", creator: { coder in
                return DisplayScreenViewController(coder: coder, division: self.division)
            }) else {
                fatalError("Failed in load Setup View Controller from storyboard")
            }
            
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
