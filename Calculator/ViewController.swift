//
//  ViewController.swift
//  Calculator
//
//  Created by 김주영 on 2022/01/25.
//

import UIKit

class ViewController: UIViewController {

    var presentNumber: Double!
    var temporaryValue: Double?
    var digit: Int!
    @IBOutlet var btnZero: UIButton!
    @IBOutlet var btnOne: UIButton!
    @IBOutlet var btnTwo: UIButton!
    @IBOutlet var btnThree: UIButton!
    @IBOutlet var btnFour: UIButton!
    @IBOutlet var btnFive: UIButton!
    @IBOutlet var btnSix: UIButton!
    @IBOutlet var btnSeven: UIButton!
    @IBOutlet var btnEight: UIButton!
    @IBOutlet var btnNine: UIButton!
    @IBOutlet var btnAC: UIButton!
    @IBOutlet var btnPlMa: UIButton!
    @IBOutlet var btnPercent: UIButton!
    @IBOutlet var btnDevide: UIButton!
    @IBOutlet var btnMulti: UIButton!
    @IBOutlet var btnPlus: UIButton!
    @IBOutlet var btnMius: UIButton!
    @IBOutlet var btnDot: UIButton!
    @IBOutlet var btnEqual: UIButton!
    @IBOutlet var lblNumber: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        presentNumber = 0
        digit = 1
        btnZero.tag = 0
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton){
        if presentNumber >= 0{
            presentNumber = presentNumber * 10 + Double((sender.titleLabel?.text)!)!
        }else{
            presentNumber = presentNumber * 10 - Double((sender.titleLabel?.text)!)!
        }
        digit += 1
        lblNumber.text! = convertToDecimal(presentNumber, digit: digit)
    }
    
    func convertToDecimal(_ number: Double, digit: Int) -> String{
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        numberFormat.maximumSignificantDigits = digit
        
        return numberFormat.string(from: NSNumber(value: number))!
    }

    @IBAction func touchCancelButton(_ sender: UIButton){
        lblNumber.text = "0"
        presentNumber = 0
        digit = 1
    }
    
    @IBAction func touchPlmaButton(_ sender: UIButton){
        presentNumber = -presentNumber
        lblNumber.text! = convertToDecimal(presentNumber, digit: digit)
    }
    
    @IBAction func applyPercentage(_ sender: UIButton){
        digit += 2
        presentNumber *= 0.01
        lblNumber.text! = convertToDecimal(presentNumber, digit: digit)
    }

    @IBAction func calculate(_ sender: UIButton){
        
    }

    @IBAction func plusOperation(_ sender: UIButton){
        temporaryValue = presentNumber
        presentNumber = 0
    }
    
    @IBAction func operate(_ sender: UIButton){
        if let num = temporaryValue{
            lblNumber.text! = convertToDecimal((num + presentNumber), digit: digit)
        }

        
    }
}


