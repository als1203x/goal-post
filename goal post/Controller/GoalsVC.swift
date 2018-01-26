//
//  ViewController.swift
//  goal post
//
//  Created by LinuxPlus on 1/25/18.
//  Copyright © 2018 ARC. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    
    @IBAction func addGoalBtnPressed(_ sender: Any) {
   
    }
}


extension GoalsVC: UITableViewDelegate, UITableViewDataSource   {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell  else { return UITableViewCell() }
        cell.configureCell(description: "Eat a salad", type: .shortTerm, goalProgressAmount: 2)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}