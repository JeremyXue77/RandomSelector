//
//  PickerViewViewController.swift
//  RandomSelector
//
//  Created by JeremyXue on 2018/6/26.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class PickerViewViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // Picker view
    var pickerView:UIPickerView!
    var pickerViewDataSize:Int!
    
    var pickerViewData = [String]()
    
    @IBAction func randomTest(_ sender: UIButton) {
        randomPicker()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpPickerView(data: ["Mom's Touch","三媽臭臭鍋","49扁食","吉紅鮮","鹹豬肉炒飯","牛肉麵"])
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Picker view delegate & functions
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewDataSize
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[row % pickerViewData.count]
    }
    
    // MARK: - Custom functions
    
    func setUpPickerView(data:[String]) {
        
        pickerViewData = data
        
        pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 3)
        pickerView.center = view.center
        
        view.addSubview(pickerView)
        
        // Setting PickView size
        pickerViewDataSize = 100 * pickerViewData.count
        
        // Starting from the middle of the PickerView
        pickerView.selectRow(pickerViewDataSize / 2, inComponent: 0, animated: false)
        
    }
    
    func randomPicker() {
        
        // Back to the middle of pickerView
        let position = self.pickerViewDataSize / 2 + pickerView.selectedRow(inComponent: 0) % self.pickerViewData.count
        self.pickerView.selectRow(position, inComponent: 0, animated: false)
        
        // Start Position
        var row = self.pickerViewDataSize / 2
        // Random Range
        let random = row + Int(arc4random() % UInt32(pickerViewDataSize / pickerViewData.count))
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            if row < random {
                row += 1
                print(random,row)
                self.pickerView.selectRow(row, inComponent: 0, animated: true)
            } else {
                timer.invalidate()
            }
        }
        
    }

}
