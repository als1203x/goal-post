//
//  UIViewExt.swift
//  goal post
//
//  Created by LinuxPlus on 1/26/18.
//  Copyright © 2018 ARC. All rights reserved.
//

import UIKit

extension UIView    {
    
    //Add observer to fire when keyboard changes frame
    func bindToKeyboard()   {
        NotificationCenter.default.addObserver(self, selector: #selector(keywillChnage(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
        
    }
    
    @objc func keywillChnage(_ notification: Notification)    {
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let startingFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
        
        
    }
}
