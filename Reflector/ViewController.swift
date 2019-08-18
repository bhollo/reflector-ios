//
//  ViewController.swift
//  Reflector
//
//  Created by derrick rocha on 8/1/19.
//  Copyright © 2019 derrick rocha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var picker:UIPickerView!
    
    var pickerData: [String] = [String]()
    var selectedColor: UIColor = UIColor.red
    var interval: Int = 500
    
    override func viewDidLoad() {
        super .viewDidLoad()
        // Connect data:
        self.picker.delegate = self
        self.picker.dataSource = self

        pickerData = ["Red", "Green", "Yellow", "Blue"]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        var color = UIColor.black
        switch titleData {
        case "Red":
            color = UIColor.red
            
        case "Green":
            color = UIColor.green
            
        case "Yellow":
            color = UIColor.yellow
        case "Blue":
            color = UIColor.blue
        default:
            color = UIColor.black
        }
        
        let title = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.foregroundColor: color])
        
        return title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = pickerData[row]
        switch item{
        case "Red":
            selectedColor = UIColor.red

        case "Green":
            selectedColor = UIColor.green


        case "Yellow":
            selectedColor = UIColor.yellow
            
        case "Blue":
            selectedColor = UIColor.blue
            
        default:
            selectedColor = UIColor.red
        }
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
       /* let progress = Double(sender.value)
        if (progress <= 0){
            interval = 0.5
            return
        }
        interval = 1/progress*/
        
        let progress = Int(sender.value)
        if (progress <= 0){
            interval = 500
            return
        }
        interval = 500/progress

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? ReflectorViewController
        let time = Double(interval)
        controller?.interval = time/1000
        controller?.selectedColor = selectedColor
    }
    
   /* @IBAction func onStartClicked(_ sender: Any) {
        let controller: ReflectorViewController = ReflectorViewController()
        let time = Double(interval)
        controller.interval = time/1000
        controller.selectedColor = selectedColor
        
        self.present(controller, animated: true, completion: nil)
        
    }*/
}

