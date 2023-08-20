//
//  ViewController.swift
//  Counter
//
//  Created by Глеб Хамин on 20.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var otputWindow: UILabel!
    
    @IBOutlet weak var buttonPlus: UIButton!
    
    @IBOutlet weak var buttonMinus: UIButton!
    
    @IBOutlet weak var buttonReset: UIButton!
    
    @IBOutlet weak var historyWindow: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        otputWindow.text = "0"
        historyWindow.isEditable = false
        
    }
    var counterNumber = 0
    let storyTitle = "История изменений:"
    var historyText = ""
    
    @IBAction func increaseByOne(_ sender: Any) {
        counterNumber += 1
        printNewResult()
        historyUpdate("значение изменено на +1")
    }
    
    @IBAction func decreaseByOne(_ sender: Any) {
        if counterNumber > 0 {
            counterNumber -= 1
            printNewResult()
            historyUpdate("значение изменено на -1")
        } else {
            historyUpdate("попытка уменьшить значение счётчика ниже 0")
        }
        
    }
    
    @IBAction func resetValue(_ sender: Any) {
        counterNumber = 0
        printNewResult()
        historyUpdate("значение сброшено")
    }
    
    func printNewResult() {
        otputWindow.text = "Значение счётчика: \(counterNumber)"
    }
    
    func historyUpdate(_ eventRecording: String) {
        let currentTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        
        let formattedTime = dateFormatter.string(from: currentTime)
        historyText = "\(formattedTime): \(eventRecording)\n" + historyText
        
        historyWindow.text = "\(storyTitle)\n\(historyText)"
    }

}

