//
//  ReflectorViewController.swift
//  Reflector
//
//  Created by derrick rocha on 8/15/19.
//  Copyright © 2019 derrick rocha. All rights reserved.
//

import UIKit

class ReflectorViewController: UIViewController {
    
    var interval: Double = 0.5
    var selectedColor: UIColor?
        private var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isIdleTimerDisabled = true
        UIScreen.main.brightness = 1
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(self.changeBackground), userInfo: nil, repeats: true)
    }
    
    @objc func changeBackground(){
        let currentColor = self.view.backgroundColor
        if(currentColor == self.selectedColor){
            self.view.backgroundColor = UIColor.black
        }
        else{
            self.view.backgroundColor = self.selectedColor
        }
    }
}
