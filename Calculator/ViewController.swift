//
//  ViewController.swift
//  Calculator
//
//  Created by Armando Silveira on 5/11/17.
//  Copyright © 2017 Armando Silveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    let calculations: CalculationDelegate = DefaultCalculationDelegate()
    

    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func addButtonPressed(_ sender: UIButton) {
        /* ⌘-Clicking on something in Xcode takes you to where that something is defined in code, so ⌘-Click on the plus sign to see its declaration in the Swift standard library:
         @warn_unused_result
         public func +(lhs: Double, rhs: Double) -> Double
         */
        
        setOperator("+", withFunction: +)
    }
    
    @IBAction func subtractButtonPressed(_ sender: UIButton) {
        setOperator("-", withFunction: -)
    }
    
    @IBAction func multiplyButtonPressed(_ sender: UIButton) {
        setOperator("*", withFunction: *)
    }
    
    @IBAction func divideButtonPressed(_ sender: UIButton) {
        setOperator("/", withFunction: /)
    }
    
    @IBAction func equalsButtonPressed(_ sender: UIButton) {
        calculations.clearInputAndSave(true)
        resultLabel.text = calculations.resultNumber.roundedString
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        calculations.clearInputAndSave(false)
        resultLabel.text = calculations.resultNumber.roundedString
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        let buttonNumber = Int(sender.titleLabel!.text!)!
        calculations.handleInput(buttonNumber)
        
        resultLabel.text = calculations.resultNumber.roundedString
    }
    
    func setOperator(_ character: String, withFunction function: @escaping (Double, Double) -> Double) {
        
        let customOperator = DefaultOperator(forCharacter: character, withFunction: function)
        calculations.setOperator(customOperator)
        
        // update the text on the screen
        resultLabel.text = calculations.resultNumber.roundedString
        
    }

    
}

