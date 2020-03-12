//
//  PersonTableViewCell.swift
//  FindACrew
//
//  Created by krikaz on 3/12/20.
//  Copyright © 2020 thewire. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    
    var person: Person? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let person = person else { return }
        nameLabel.text = person.name
        genderLabel.text = "Gender: \(person.gender)"
        birthYearLabel.text = "Birth year: \(person.birthYear)"
    }
    
}
