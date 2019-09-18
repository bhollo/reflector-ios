//
//  ReflectorViewController.swift
//  Reflector
//
//  Created by derrick rocha on 8/15/19.
//  Copyright © 2019 Bhollo. All rights reserved.
//

import UIKit

class ReflectorViewController: UIViewController {
    
    var interval: Double = 0.5
    var selectedColor: UIColor?
    var forSOS: Bool = false
    
    let sosIntervals = [0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 1, 0.25, 1, 0.25, 1, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 1]
    
    
    var running: Bool = true
    
    private var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isIdleTimerDisabled = true
        UIScreen.main.brightness = 1
        if(forSOS){
            startSOSSequence()
        }
        else{
            timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(self.changeBackground), userInfo: nil, repeats: true)
        }
    }
    
    private func startSOSSequence(){
        DispatchQueue.global(qos: .background).async
            {
                while(self.running){
                    for interval in self.sosIntervals{
                        DispatchQueue.main.async //serial queue
                            {
                                self.changeBackground()
                        }
                        Thread.sleep(forTimeInterval: interval)
                    }
                }
        }
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
    
    override func viewDidDisappear(_ animated: Bool) {
        running = false
    }
}
