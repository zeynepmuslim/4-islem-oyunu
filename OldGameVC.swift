//
//  OldGameVC.swift
//  4IslemOyunu
//
//  Created by Zeynep Müslim on 17.08.2020.
//  Copyright © 2020 Zeynep Müslim. All rights reserved.
//

import UIKit

class OldGameVC: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var skorView: UIView!
    @IBOutlet weak var answerButton: UIButton!
    
    @IBOutlet weak var finishView: UIView!
    @IBOutlet weak var newGame: UIButton!
    @IBOutlet weak var timeOverView: UIView!
    @IBOutlet weak var correctView: UIView!
    @IBOutlet weak var wrongView: UIView!
    @IBOutlet weak var finishBlueView: UIView!
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var timeOverLabel: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var skorLabel: UILabel!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var finishTimeOverLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var backToMainMenu: UIButton!
    
    var opera2 = ["+", "-", "÷", "x"]
    var numberOne2 = Int()
    var numberTwo2 = Int()
    var result2 = Int()
    var right2 = 0
    var mistake2 = 0
    
    var timer2 = Timer()
    var counter2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter2 = 30
        time.text = "\(counter2)"
        
        let wi = view.frame.size.width
        let he = view.frame.size.height
        
        mainView.frame = CGRect(x: wi * 0.5 - wi * 0.45, y: he * 0.07, width: wi * 0.9, height: he * 0.5)
        
        let wi2 = mainView.frame.size.width
        let he2 = mainView.frame.size.height
        
        let fix = he2 * 0.02
        
        header.frame = CGRect(x: wi2 * 0.5 - wi2 * 0.25, y: fix, width: wi2 * 0.5, height: he2 * 0.08)
        headerLabel.frame = CGRect(x: 0, y: 0, width: header.frame.size.width, height: header.frame.size.height)
        gameView.frame = CGRect(x: wi2 * 0.5 - wi2 * 0.96 / 2, y: 2 * fix + he2 * 0.08, width: wi2 * 0.96, height: he2 * 0.35)
        
        let wi4 = gameView.frame.size.width
        let he4 = gameView.frame.size.height
        
        gameLabel.frame = CGRect(x: 0, y: 0, width: wi4 * 0.66, height: he4)
        textView.frame = CGRect(x: wi4 * 0.66, y: he4 * 0.1, width: wi4 * 0.3, height: he4 * 0.8)
        textField.frame = CGRect(x: 0, y: 0, width: textView.frame.size.width, height: textView.frame.size.height)
        
        answerButton.frame = CGRect(x: wi2 * 0.5 - wi2 * 0.96 / 2, y: 3 * fix + he2 * 0.08 + he2 * 0.35, width: wi2 * 0.96, height: he2 * 0.1)
        timeView.frame = CGRect(x: fix, y: 4 * fix + he2 * 0.08 + he2 * 0.35 + he2 * 0.1, width: wi2 * 0.96 / 2 - fix / 2, height: he2 * 0.35)
        
        let wi5 = timeView.frame.size.width
        let he5 = timeView.frame.size.height
        
        timeOverLabel.frame = CGRect(x: 0, y: he5 * 0.08, width: wi5, height: he5 * 0.2)
        time.frame = CGRect(x: 0, y: he5 * 0.2, width: wi5, height: he5 * 0.8)
        
        
        skorView.frame = CGRect(x: 2.5 * fix + wi2 * 0.96 / 2 - fix, y: 4 * fix + he2 * 0.08 + he2 * 0.35 + he2 * 0.1, width: wi2 * 0.96 / 2 - fix, height: he2 * 0.35)
      
        let wi6 = skorView.frame.size.width
        let he6 = skorView.frame.size.height
        
        skorLabel.frame = CGRect(x: 0, y: he6 * 0.08, width: wi6, height: he6 * 0.2)
        greenView.frame = CGRect(x: wi6 * 0.08, y: he6 * 0.36, width: wi6 * 0.38, height: he6 * 0.52)
        greenLabel.frame = CGRect(x: 0, y: 0, width: greenView.frame.size.width, height: greenView.frame.size.height)
        redView.frame = CGRect(x: wi6 * 0.16 + greenView.frame.size.width, y: he6 * 0.36, width: wi6 * 0.38, height: he6 * 0.52)
        redLabel.frame = CGRect(x: 0, y: 0, width: redView.frame.size.width, height: redView.frame.size.height)
        
        finishView.frame = CGRect(x: wi * 0.5 - wi * 0.45, y: he * 0.07, width: wi * 0.9, height: he * 0.3)
        finishBlueView.frame = CGRect(x: 0,y: 0, width: wi * 0.9, height: he * 0.15)
        
        newGame.frame = CGRect(x: 0, y: fix + he * 0.15, width: wi * 0.9 / 2 - fix / 2, height: he * 0.05)
        
        let he3 = finishBlueView.frame.size.height
        let wi3 = finishBlueView.frame.size.width
        
        timeOverView.frame = CGRect(x: wi3 * 0.1, y: fix, width: wi3 * 0.8, height: he3 * 0.3)
        finishTimeOverLabel.frame = CGRect(x: 0, y: 0, width: timeOverView.frame.size.width, height: timeOverView.frame.size.height)
        
        correctView.frame = CGRect(x: fix, y: 2 * fix + he3 * 0.3, width: wi * 0.45 - 1.5 * fix, height: he3 * 0.5)
        correctLabel.frame = CGRect(x: 0, y: 0, width: correctView.frame.size.width, height: correctView.frame.size.height)
        
        wrongView.frame = CGRect(x: 2 * fix + (wi * 0.45 - 1.5 * fix), y: 2 * fix + he3 * 0.3, width: wi * 0.45 - 1.5 * fix, height: he3 * 0.5)
        wrongLabel.frame = CGRect(x: 0, y: 0, width: wrongView.frame.size.width, height: wrongView.frame.size.height)
        
        backToMainMenu.frame = CGRect(x: wi * 0.9 / 2 + fix / 2, y: fix + he * 0.15, width: wi * 0.9 / 2 - fix / 2, height: he * 0.05)
        
        
        
        cornerRad(i: mainView)
        header.layer.cornerRadius = 10
        cornerRad(i: gameView)
        cornerRad(i: timeView)
        cornerRad(i: skorView)
        answerButton.layer.cornerRadius = 10
        newGame.layer.cornerRadius = 10
        backToMainMenu.layer.cornerRadius = 10
        timeOverView.layer.cornerRadius = 10

        cornerRad(i: correctView)
        cornerRad(i: wrongView)
        cornerRad(i: finishBlueView)
        cornerRad(i: textView)
        cornerRad(i: greenView)
        cornerRad(i: redView)
        greenView.layer.borderWidth = 4
        greenView.layer.borderColor = UIColor(red:0.25, green:0.55, blue:0.35, alpha:1.0).cgColor
        redView.layer.borderWidth = 4
        redView.layer.borderColor = UIColor(red:0.58, green:0.28, blue:0.27, alpha:1.0).cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        finishView.isHidden = true
        mainView.isHidden = false
        
        right2 = 0
        mistake2 = 0
        textField.text = ""
        redLabel.text = "0"
        greenLabel.text = "0"
        counter2 = 30
        
        time.text = "\(counter2)"
        newQuest()
        
        timer2 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        counter2 -= 1
        
    }
    
    @objc func timerFunction(){
        time.text = String(counter2)
        counter2 -= 1
              
        if counter2 < 0 {
            timer2.invalidate()
            time.text = "0"
            finishView.isHidden = false
            mainView.isHidden = true
            
            
            correctLabel.text = "Doğru: \(right2)"
            wrongLabel.text = "Yanlış: \(mistake2)"
            
            
        }
    }
    
    
    func newQuest(){
        // level 1 eksi(50) işlem yok çarpalar 10 altı toplamlar 50 bölmeler 50 e kadar
        // level 2 eksi 70 çarpalar 15 altı toplamlar 100 bölme 100 e kdar
        // level 3 eksi 200 çarpalar 20 altı toplamlar 200 bölm2 200 e kadar
        let randomOpera = opera2.randomElement()
        
        // Level 1
        if randomOpera == "+" {
            print("+")
            numberOne2 = Int.random(in: 0..<51)
            numberTwo2 = Int.random(in: 0..<51)
            result2 = numberOne2 + numberTwo2
            gameLabel.text = "\(numberOne2) + \(numberTwo2) ="
        }
        
        if randomOpera == "-" {
            print("-")
            
            var i = true
            
            while i == true  {
                numberOne2 = Int.random(in: 1..<51)
                numberTwo2 = Int.random(in: 1..<51)
                if numberOne2 - numberTwo2 > 0 {
                    result2 = numberOne2 - numberTwo2
                    gameLabel.text = "\(numberOne2) - \(numberTwo2) ="
                    i = false
                }
            }
        }

        if randomOpera == "÷" {
            print("÷")

            var i = true
            
            while i == true  {
                numberOne2 = Int.random(in: 1..<51)
                numberTwo2 = Int.random(in: 1..<51)
                if numberOne2 % numberTwo2 == 0 {
                    result2 = numberOne2 / numberTwo2
                    gameLabel.text = "\(numberOne2) ÷ \(numberTwo2) ="
                    i = false
                }
            }
            
        }

        if randomOpera == "x" {
            print("x")
            numberOne2 = Int.random(in: 0..<11)
            numberTwo2 = Int.random(in: 0..<11)
            result2 = numberOne2 * numberTwo2
            gameLabel.text = "\(numberOne2) x \(numberTwo2) ="
        }
        
        print("\(result2)    orijinal")
    }

    @IBAction func answerClicked(_ sender: Any) {
        
        if textField.text == String(result2){
            right2 += 1
            greenLabel.text = String(right2)
            print("doğru")
        } else {
            mistake2 += 1
            redLabel.text = String(mistake2)
            print("yanlış")
        }
        
        
        textField.text = ""
        newQuest()
        
    }
    
    @IBAction func newGameClicked(_ sender: Any) {
        viewWillAppear(true)
    }
    
    @IBAction func backToManuClicked(_ sender: Any) {
    }

    func cornerRad(i : UIView){
        i.layer.cornerRadius = 20
    }
}
