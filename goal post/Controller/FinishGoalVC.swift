//
//  FinishGoalVC.swift
//  goal post
//
//  Created by LinuxPlus on 1/26/18.
//  Copyright © 2018 ARC. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var pointTextField: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!

    //Variables
    var goalDescription: String!
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointTextField.delegate = self
        createGoalBtn.bindToKeyboard()
    }

    func initData(description: String, type: GoalType)  {
        goalDescription = description
        goalType = type
    }
    

    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    
    @IBAction func createGoalPressed(_ sender: Any) {
        //Pass data to Core Data Model
        if pointTextField.text != nil   {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
            //instance of goal
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do  {
            try managedContext.save()
            completion(true)
        }catch {
            debugPrint("Clound not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
