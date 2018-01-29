//
//  ViewController.swift
//  simple-calc
//
//  Created by Christy Lu on 1/27/18.
//  Copyright © 2018 Christy Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen: Double = 0
    var preNum: Double = 0
    var performingMath = false
    var operation = 0
    var count = 1
    var sum: Double = 0
    var numOfDec = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func Numbers(_ sender: UIButton) {
        if performingMath {
            if sender.tag == 20 {
                label.text = ""
            } else {
                label.text = String(sender.tag - 1)
                numberOnScreen = Double(label.text!)!
            }
            performingMath = false
            numOfDec = 0
        } else {
            if sender.tag == 20 {
                if label.text != "" && numOfDec == 0 {
                    label.text = label.text! + "."
                    numOfDec = 1
                }
            } else {
                label.text = label.text! + String(sender.tag - 1)
                numberOnScreen = Double(label.text!)!
            }
            
        }
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 19 {
            preNum = Double(label.text!)!
            switch sender.tag {
            case 18: // plus
                label.text = label.text! + " + "
            case 17: // subtracts
                label.text = "-"
            case 16: // times
                label.text = "x"
            case 15: // divide
                label.text = "/"
            case 13: // fact
                //label.text = "fact"
                var res = 1
                if numberOnScreen > 0 {
                    for index in 1...Int(numberOnScreen) {
                        res *= index
                    }
                }
                label.text = String(res)
            case 12: // avg
                label.text = "avg"
                sum = sum + numberOnScreen
                count = count + 1
            case 11: //count
                label.text = "count"
                count = count + 1
            default:
                label.text = ""
                preNum = 0
                numberOnScreen = 0
                operation = 0
                count = 1
                sum = 0
                numOfDec = 0
            }
            
            operation = sender.tag
            performingMath = true
        } else if sender.tag == 19 {
            switch operation {
            case 18:
                label.text = String(preNum + numberOnScreen)
            case 17:
                label.text = String(preNum - numberOnScreen)
            case 16:
                label.text = String(preNum * numberOnScreen)
            case 15:
                label.text = String(preNum / numberOnScreen)
            case 11:
                label.text = String(count)
            case 12:
                sum = sum + numberOnScreen
                label.text = String(sum / Double(count))
                
            default:
                label.text = ""
            }
            
            performingMath = true
            count = 1
            sum = 0
            numOfDec = 0
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

