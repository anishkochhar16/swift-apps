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
    @IBAction func confirmButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Setup: \(division.code)"
        enjoymentPicker.dataSource = self
        enjoymentPicker.delegate = self
        effortPicker.delegate = self
        effortPicker.dataSource = self
    }
    
}
