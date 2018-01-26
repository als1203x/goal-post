//
//  GoalCell.swift
//  goal post
//
//  Created by LinuxPlus on 1/25/18.
//  Copyright © 2018 ARC. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

  
   
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    
    func configureCell(description: String, type: GoalType, goalProgressAmount: Int)  {
        goalDescriptionLbl.text = description
        goalTypeLbl.text = type.rawValue
        goalProgressLbl.text = String(describing: goalProgressAmount)
    }
    
    
}
