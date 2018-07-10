//
//  ViewController.swift
//  BMICalculator
//
//  Created by Arbiyanto Wijaya on 09/07/18.
//  Copyright © 2018 Arbiyanto Wijaya. All rights reserved.
//

import UIKit

extension Float {
    func format() -> String {
        return String(format: "%.1f", self)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedMenu: UISegmentedControl!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightText: UILabel!
    @IBOutlet weak var heightText: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var bmiTitle: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var bmiStatusLabel: UILabel!
    
    
    @IBAction func weightChanged(_ sender: Any) {
        self.weightText.text = self.weightSlider.value.format()
        
        self.bmiCount()
    }
    
    @IBAction func heightChanged(_ sender: Any) {
        self.heightText.text = self.heightSlider.value.format()
        
        self.bmiCount()
    }
    
    @IBAction func menuChanged(_ sender: Any) {
        if (self.segmentedMenu.selectedSegmentIndex == 0) {
            self.setLightTheme()
        } else {
            self.setDarkTheme()
        }
    }
    
    func setLightTheme() {
        self.backgroundView.backgroundColor = UIColor.white
        self.bmiLabel.textColor = UIColor.black
        self.weightLabel.textColor = UIColor.black
        self.heightLabel.textColor = UIColor.black
        self.bmiTitle.textColor = UIColor.black
    }
    
    func setDarkTheme() {
        self.backgroundView.backgroundColor = UIColor.black
        self.bmiLabel.textColor = UIColor.white
        self.weightLabel.textColor = UIColor.white
        self.heightLabel.textColor = UIColor.white
        self.bmiTitle.textColor = UIColor.white
    }
    
    
    func bmiCount() {
        let bmi = self.weightSlider.value / (self.heightSlider.value*self.heightSlider.value)
        self.bmiNumberLabel.text = bmi.format()
        
        if bmi < 18.4 {
            self.bmiStatusLabel.text = "Underweight"
            self.bmiStatusLabel.textColor = UIColor.gray
            self.bmiNumberLabel.textColor = UIColor.gray
        } else if bmi < 25.0 {
            self.bmiStatusLabel.text = "Healthy"
            self.bmiStatusLabel.textColor = UIColor.green
            self.bmiNumberLabel.textColor = UIColor.green
        } else if bmi < 27.0 {
            self.bmiStatusLabel.text = "Overweight"
            self.bmiStatusLabel.textColor = UIColor.orange
            self.bmiNumberLabel.textColor = UIColor.orange
        } else  if bmi < 32 {
            self.bmiStatusLabel.text = "Severly Overweight"
            self.bmiStatusLabel.textColor = UIColor.brown
            self.bmiNumberLabel.textColor = UIColor.brown
        } else {
            self.bmiStatusLabel.text = "Obese"
            self.bmiStatusLabel.textColor = UIColor.red
            self.bmiNumberLabel.textColor = UIColor.red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

