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
    
    private var running = true
    
    private var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       /* let timeToSleep = UInt32(0.5)
        let thread = Thread {
            while(self.running){
                sleep(timeToSleep)
                DispatchQueue.main.async {
                    self.changeBackground()
                }
            }
        }
        thread.start()*/
        
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(self.changeBackground), userInfo: nil, repeats: true)

       // self.changeBackground()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}