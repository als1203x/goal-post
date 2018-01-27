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
    
    
    func configureCell(goal: Goal)  {
        self.goalDescriptionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(goal.goalProgress)
    }
    
    
}
