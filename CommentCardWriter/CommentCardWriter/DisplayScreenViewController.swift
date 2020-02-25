//
//  DisplayScreenViewController.swift
//  CommentCardWriter
//
//  Created by Kochhar, Anish (EJNR) on 25/02/2020.
//  Copyright © 2020 Kochhar, Anish (EJNR). All rights reserved.
//

import UIKit

class DisplayScreenViewController: UIViewController {

    let division: Division
    @IBOutlet weak var commentDisplayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentDisplayLabel.text = division.opinion?.displayStats()
        // Do any additional setup after loading the view.
    }

    init?(coder: NSCoder, division: Division) {
        self.division = division
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
