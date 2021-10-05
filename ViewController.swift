//
//  ViewController.swift
//  4IslemOyunu
//
//  Created by Zeynep Müslim on 16.08.2020.
//  Copyright © 2020 Zeynep Müslim. All rights reserved.
//

// phone 8 arttırdın sığmıyor




import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var botton0: UIButton!
    @IBOutlet weak var buttonAnswer: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var header: UILabel!
    
    @IBOutlet weak var playGroundView: UIView!
    
    @IBOutlet weak var resultView: UIView!
    
    @IBOutlet weak var timeView: UIView!
    
    @IBOutlet weak var skorView: UIView!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var highscore: UILabel!
    
    @IBOutlet weak var operation: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var skorLabel: UILabel!
    @IBOutlet weak var TrueLabel: UILabel!
    @IBOutlet weak var FalseLabel: UILabel!
    @IBOutlet weak var trueView: UIView!
    @IBOutlet weak var falseView: UIView!
    @IBOutlet weak var wrong: UILabel!
    @IBOutlet weak var correct: UILabel!
    
    @IBOutlet weak var levelTabel: UIView!
    @IBOutlet weak var levelOne: UIButton!
    @IBOutlet weak var levelTwo: UIButton!
    @IBOutlet weak var levelThree: UIButton!
    
    
    var opera = ["+", "-", "÷", "x"]
    var numberOne = Int()
    var numberTwo = Int()
    var result = Int()
    var right = 0
    var mistake = 0
    var levelStatu = Int()
    var nowScore = Int()
    var timer = Timer()
    var counter = 0
    
    var highscoreCurrent = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelStatu = UserDefaults.standard.integer(forKey: "level")
        if levelStatu != 1 && levelStatu != 2 && levelStatu != 3 {
            UserDefaults.standard.set(2, forKey: "level")
            levelStatu = UserDefaults.standard.integer(forKey: "level")
        }
        
        progressBar.isHidden = true
        
        
        nowScore = right - mistake
       
        let wi = view.frame.size.width
        let he = view.frame.size.height
        
        myView.frame = CGRect(x: wi * 0.5 - wi * 0.85 / 2, y: he * 0.54, width: wi * 0.85, height: he * 0.45)
        
        let wi2 = myView.frame.size.width
        let he2 = myView.frame.size.height
               
        let buttonHe = he2 * 0.21
        let buttonWi = wi2 * 0.28
        let buttonHeAralık = he2 * 0.04
        
        button.frame = CGRect(x: 0, y: 0, width: buttonWi, height: buttonHe)
        button4.frame = CGRect(x: 0, y: buttonHe + buttonHeAralık, width: buttonWi, height: buttonHe)
        button1.frame = CGRect(x: 0, y: 2 * (buttonHe + buttonHeAralık), width: buttonWi, height: buttonHe)
        button7.frame = CGRect(x: wi2 / 2 - buttonWi / 2 , y: 0, width: buttonWi, height: buttonHe)
        button9.frame = CGRect(x: wi2 - buttonWi, y: 0, width: buttonWi, height: buttonHe)
        button5.frame = CGRect(x: wi2 / 2 - buttonWi / 2, y: buttonHe + buttonHeAralık, width: buttonWi, height: buttonHe)
        button6.frame = CGRect(x: wi2 - buttonWi, y: buttonHe + buttonHeAralık, width: buttonWi, height: buttonHe)
        button2.frame = CGRect(x: wi2 / 2 - buttonWi / 2, y: 2 * (buttonHe + buttonHeAralık), width: buttonWi, height: buttonHe)
        button3.frame = CGRect(x: wi2 - buttonWi, y: 2 * (buttonHe + buttonHeAralık), width: buttonWi, height: buttonHe)
        buttonMinus.frame = CGRect(x: 0, y: 3 * (buttonHe + buttonHeAralık), width: buttonWi, height: buttonHe)
        botton0.frame = CGRect(x: wi2 / 2 - buttonWi / 2, y: 3 * (buttonHe + buttonHeAralık), width: buttonWi, height: buttonHe)
        buttonAnswer.frame = CGRect(x: wi2 - buttonWi, y: 3 * (buttonHe + buttonHeAralık), width: buttonWi, height: buttonHe)
        
        mainView.frame = CGRect(x: wi * 0.5 - wi * 0.85 / 2, y: he * 0.11, width: wi * 0.85, height: he * 0.41)
        
        header.frame = CGRect(x: wi * 0.5 - wi * 0.85 / 2, y: he * 0.05, width: wi * 0.4, height: he * 0.07)
        
        let wi3 = mainView.frame.size.width
        let he3 = mainView.frame.size.height
        let fix = wi3 * 0.02
        
        playGroundView.frame = CGRect(x: fix, y: fix, width: wi3 * 0.96, height: he3 * 0.29)
        resultView.frame = CGRect(x: fix, y: 2 * fix + he3 * 0.29, width: wi3 * 0.96, height: he3 * 0.17)
        timeView.frame = CGRect(x: fix, y: 3 * fix + he3 * 0.29 + he3 * 0.17, width: wi3 * 0.96 / 2 - fix / 2, height: he3 * 0.39)
        skorView.frame = CGRect(x: 2 * fix + (wi3 * 0.96 / 2 - fix / 2), y: 3 * fix + he3 * 0.29 + he3 * 0.17, width: wi3 * 0.96 / 2 - fix / 2, height: he3 * 0.39)
        progressBar.frame = CGRect(x: fix, y: 4.5 * fix + he3 * 0.29 + he3 * 0.17 + he3 * 0.39, width: wi3 * 0.96 / 2 - fix , height: he3 * 0.045)
        highscore.frame = CGRect(x: fix , y: 4 * fix + he3 * 0.29 + he3 * 0.17 + he3 * 0.39, width: wi3 * 0.96, height: he3 * 0.045)
        
        operation.frame = CGRect(x: 0, y: 0, width: playGroundView.frame.size.width, height: playGroundView.frame.size.height)
        resultLabel.frame = CGRect(x: 0, y: 0, width: resultView.frame.size.width, height: resultView.frame.size.height)
        
        let wiTime = timeView.frame.size.width
        let heTime = timeView.frame.size.height
        
        timeLabel.frame = CGRect(x: 0, y: fix, width: wiTime, height: heTime * 0.21)
        time.frame = CGRect(x: 0, y: fix + heTime * 0.21, width: wiTime, height: heTime - (heTime * 0.21) - fix)
        
        skorLabel.frame = CGRect(x: 0, y: fix, width: wiTime, height: heTime * 0.23)
        TrueLabel.frame = CGRect(x: 0, y: 2 * fix + heTime * 0.23, width: wiTime / 2, height: heTime * 0.19)
        FalseLabel.frame = CGRect(x: 0 + wiTime / 2, y: 2 * fix + heTime * 0.23, width: wiTime / 2, height: heTime * 0.19)
        
        trueView.frame = CGRect(x: fix,
                                y: 3 * fix + heTime * 0.23 + heTime * 0.19,
                                width: wiTime / 2 - 1.5 * fix,
                                height: heTime * 0.35)

        falseView.frame = CGRect(x: wiTime - wiTime / 2 + 0.5 * fix,
                                y: 3 * fix + heTime * 0.23 + heTime * 0.19,
                                width: wiTime / 2 - 1.5 * fix,
                                height: heTime * 0.35)
        
        correct.frame = CGRect(x: 0, y: 0, width: trueView.frame.size.width, height: trueView.frame.size.height)
      
        wrong.frame = CGRect(x: 0, y: 0, width: falseView.frame.size.width, height: falseView.frame.size.height)
        
        levelTabel.frame = CGRect(x: wi * 0.5, y: he * 0.05, width: wi * 0.4, height: he * 0.05)
        
        let heLevel = levelTabel.frame.size.height
        let wiLevel = levelTabel.frame.size.width
        
        
        levelOne.frame = CGRect(x: wiLevel * 0.25, y: 0, width: wiLevel / 2 - fix / 2, height: heLevel / 2 - fix / 2)
        levelTwo.frame = CGRect(x: 0, y: heLevel / 2 + fix / 2, width: wiLevel / 2 - fix / 2, height: heLevel / 2 - fix / 2)
        levelThree.frame = CGRect(x: wiLevel - (wiLevel / 2 - fix / 2), y: heLevel / 2 + fix / 2, width: wiLevel / 2 - fix / 2, height: heLevel / 2 - fix / 2)
        
        
        // Font Setings
        //TrueLabel.font = UIFont(name: TrueLabel.font.fontName, size: heTime * 0.15)
       // FalseLabel.font = UIFont(name: TrueLabel.font.fontName, size: heTime * 0.15)
        
        whiteBorderRad(i: button3)
        whiteBorderRad(i: button)
        whiteBorderRad(i: botton0)
        whiteBorderRad(i: button1)
        whiteBorderRad(i: button2)
        whiteBorderRad(i: button4)
        whiteBorderRad(i: button5)
        whiteBorderRad(i: button6)
        whiteBorderRad(i: button7)
        whiteBorderRad(i: button9)
        
        fullWhiteBorC(i: buttonAnswer)
        fullWhiteBorC(i: buttonMinus)
        
        whiteBorderRad(i: mainView)
        
        fullWhiteBorC(i: playGroundView)
        
        fullWhiteBorC(i: resultView)
        
        cornerRad(i: timeView)
        fullWhiteBorC(i: skorView)
        
        falseView.layer.cornerRadius = 15
        falseView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        trueView.layer.cornerRadius = 15
        trueView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        buttonSelec(i: levelTwo)
        buttonNotSelec(i: levelOne)
        buttonNotSelec(i: levelThree)
        
        levelStatu = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var newHighscore = Int()
        
        
        levelStatu = UserDefaults.standard.integer(forKey: "level")
        
        if levelStatu == 1 {
            buttonSelec(i: levelOne)
            buttonNotSelec(i: levelTwo)
            buttonNotSelec(i: levelThree)
            newHighscore = UserDefaults.standard.integer(forKey: "highscore")
            highscoreCurrent = newHighscore
            highscore.text = "Bu Leveldeki En Yüksek Skor: \(newHighscore)"
        } else if levelStatu == 2 {
            buttonSelec(i: levelTwo)
            buttonNotSelec(i: levelOne)
            buttonNotSelec(i: levelThree)
            newHighscore = UserDefaults.standard.integer(forKey: "highscore2")
            highscoreCurrent = newHighscore
            highscore.text = "Bu Leveldeki En Yüksek Skor: \(newHighscore)"
            
        } else if levelStatu == 3 {
            buttonSelec(i: levelThree)
            buttonNotSelec(i: levelTwo)
            buttonNotSelec(i: levelOne)
            newHighscore = UserDefaults.standard.integer(forKey: "highscore3")
            highscoreCurrent = newHighscore
            highscore.text = "Bu Leveldeki En Yüksek Skor: \(newHighscore)"
        }
//
//        let newHighscore = UserDefaults.standard.integer(forKey: "highscore")
//        highscoreCurrent = newHighscore
//        highscore.text = "Bu Leveldeki En Yüksek Skor: \(newHighscore)"
        
        
        // Sıfırlama
        correct.text = "0"
        wrong.text = "0"
        counter = 20
        resultLabel.text = "İşlemin Sonucunu Girin"
        skorLabel.text = "Skorun: 0"
        
        if levelStatu == 1 {
            newQuest1()
        } else if levelStatu == 2 {
            newQuest2()
        } else if levelStatu == 3{
            newQuest3()
        }
        
        time.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        counter -= 1
    }
    
    @objc func timerFunction(){
        time.text = String(counter)
        counter -= 1
              
        if counter < 0 {
            nowScore = right - mistake
            if highscoreCurrent < nowScore {
                if levelStatu == 1 {
                    UserDefaults.standard.set(nowScore, forKey: "highscore")
                } else if levelStatu == 2 {
                    UserDefaults.standard.set(nowScore, forKey: "highscore2")
                } else if levelStatu == 3 {
                    UserDefaults.standard.set(nowScore, forKey: "highscore3")
                }
                //
               
            }
            timer.invalidate()
            time.text = "0"
            performSegue(withIdentifier: "toFinishVC", sender: nil)
            nowScore = right - mistake
           
            
        }
    }
    
    
    
    
    @IBAction func levelOneClicked(_ sender: Any) {
       
//        buttonSelec(i: levelOne)
//        buttonNotSelec(i: levelTwo)
//        buttonNotSelec(i: levelThree)
//          print(UserDefaults.standard.integer(forKey: "level"))
//        levelStatu = 1
    }
    
    @IBAction func levelTwoClicked(_ sender: Any) {
//        buttonSelec(i: levelTwo)
//        buttonNotSelec(i: levelOne)
//        buttonNotSelec(i: levelThree)
//        print(UserDefaults.standard.integer(forKey: "level"))
//        levelStatu = 2
    }
    
    @IBAction func levelThreeClicked(_ sender: Any) {
//        buttonSelec(i: levelThree)
//        buttonNotSelec(i: levelTwo)
//        buttonNotSelec(i: levelOne)
//        print(UserDefaults.standard.integer(forKey: "level"))
//        levelStatu = 3
    }
    
    
    func newQuest1(){
        // level 1 eksi(50) işlem yok çarpalar 10 altı toplamlar 50 bölmeler 50 e kadar
        // level 2 eksi 70 çarpalar 15 altı toplamlar 100 bölme 100 e kdar
        // level 3 eksi 200 çarpalar 20 altı toplamlar 200 bölm2 200 e kadar
        let randomOpera = opera.randomElement()
        
        // Level 1
        if randomOpera == "+" {
            print("+")
            numberOne = Int.random(in: 0..<51)
            numberTwo = Int.random(in: 0..<51)
            result = numberOne + numberTwo
            operation.text = "\(numberOne) + \(numberTwo)"
        }
        
        if randomOpera == "-" {
            print("-")
            
            var i = true
            
            while i == true  {
                numberOne = Int.random(in: 1..<51)
                numberTwo = Int.random(in: 1..<51)
                if numberOne - numberTwo > 0 {
                    result = numberOne - numberTwo
                    operation.text = "\(numberOne) - \(numberTwo)"
                    i = false
                }
            }
        }

        if randomOpera == "÷" {
            print("÷")

            var i = true
            
            while i == true  {
                numberOne = Int.random(in: 1..<51)
                numberTwo = Int.random(in: 1..<51)
                if numberOne % numberTwo == 0 {
                    result = numberOne / numberTwo
                    operation.text = "\(numberOne) ÷ \(numberTwo)"
                    i = false
                }
            }
            
        }

        if randomOpera == "x" {
            print("x")
            numberOne = Int.random(in: 0..<11)
            numberTwo = Int.random(in: 0..<11)
            result = numberOne * numberTwo
            operation.text = "\(numberOne) x \(numberTwo)"
        }
        
        print("\(result)    1")
    }
    
    
    
    func newQuest2(){
        // level 1 eksi(50) işlem yok çarpalar 10 altı toplamlar 50 bölmeler 50 e kadar
        // level 2 eksi 70 çarpalar 15 altı toplamlar 100 bölme 100 e kdar
        // level 3 eksi 200 çarpalar 20 altı toplamlar 200 bölm2 200 e kadar
        
        let randomOpera = opera.randomElement()
        
        // Level 2
        if randomOpera == "+" {
            print("+")
            numberOne = Int.random(in: 0..<101)
            numberTwo = Int.random(in: 0..<101)
            result = numberOne + numberTwo
            operation.text = "\(numberOne) + \(numberTwo)"
        }
        
        if randomOpera == "-" {
            print("-")
            numberOne = Int.random(in: 0..<71)
            numberTwo = Int.random(in: 0..<71)
            result = numberOne - numberTwo
            operation.text = "\(numberOne) - \(numberTwo)"
        }

        if randomOpera == "÷" {
            print("÷")

            var i = true
            
            while i == true  {
                numberOne = Int.random(in: 1..<101)
                numberTwo = Int.random(in: 1..<101)
                if numberOne % numberTwo == 0 {
                    result = numberOne / numberTwo
                    operation.text = "\(numberOne) ÷ \(numberTwo)"
                    i = false
                }
            }
            
        }

        if randomOpera == "x" {
            print("x")
            numberOne = Int.random(in: 0..<16)
            numberTwo = Int.random(in: 0..<16)
            result = numberOne * numberTwo
            operation.text = "\(numberOne) x \(numberTwo)"
        }
        
        print("\(result)    2")

    }
    
    func newQuest3(){
        // level 1 eksi(50) işlem yok çarpalar 10 altı toplamlar 50 bölmeler 50 e kadar
        // level 2 eksi 70 çarpalar 15 altı toplamlar 100 bölme 100 e kdar
        // level 3 eksi 140 çarpalar 20 altı toplamlar 200 bölm2 200 e kadar
        
        let randomOpera = opera.randomElement()
        
        // Level 2
        if randomOpera == "+" {
            print("+")
            numberOne = Int.random(in: 0..<201)
            numberTwo = Int.random(in: 0..<201)
            result = numberOne + numberTwo
            operation.text = "\(numberOne) + \(numberTwo)"
        }
        
        if randomOpera == "-" {
            print("-")
            numberOne = Int.random(in: 0..<141)
            numberTwo = Int.random(in: 0..<141)
            result = numberOne - numberTwo
            operation.text = "\(numberOne) - \(numberTwo)"
        }

        if randomOpera == "÷" {
            print("÷")

            var i = true
            
            while i == true  {
                numberOne = Int.random(in: 1..<201)
                numberTwo = Int.random(in: 1..<201)
                if numberOne % numberTwo == 0 {
                    result = numberOne / numberTwo
                    operation.text = "\(numberOne) ÷ \(numberTwo)"
                    i = false
                }
            }
        }

        if randomOpera == "x" {
            print("x")
            numberOne = Int.random(in: 0..<21)
            numberTwo = Int.random(in: 0..<21)
            result = numberOne * numberTwo
            operation.text = "\(numberOne) x \(numberTwo)"
        }
        
        print("\(result)    3")

    }
    
    let generator = UIImpactFeedbackGenerator(style: .soft)
    
    @IBAction func minusClicked(_ sender: Any) {
        editing(i: "-")
        generator.impactOccurred()
    }
    
    @IBAction func answerClicked(_ sender: Any) {
        
        if resultLabel.text == String(result){
            right += 1
            generator.impactOccurred()
            correct.text = String(right)
            print("doğru")
        } else {
            mistake += 1
            AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)){
            }
            wrong.text = String(mistake)
            print("yanlış")
        }
        resultLabel.text = "İşlemin Sonucunu Girin"
        
        if levelStatu == 1 {
            newQuest1()
        } else if levelStatu == 2 {
            newQuest2()
        } else if levelStatu == 3{
            newQuest3()
        }
        
        skorLabel.text = "Skorun: \(right - mistake)"
        
//        if right - mistake < highscoreCurrent {
//
//            if Double(right - mistake / highscoreCurrent) <= 0.1 {
//                progressBar.progress = 0.1
//            } else if Double(right - mistake / highscoreCurrent) < 0.2 {
//                progressBar.progress = 0.2
//            } else if Double(right - mistake / highscoreCurrent) < 0.3 {
//                progressBar.progress = 0.3
//            } else if Double(right - mistake / highscoreCurrent) < 0.4 {
//                progressBar.progress = 0.4
//            } else if Double(right - mistake / highscoreCurrent) < 0.5 {
//                progressBar.progress = 0.5
//            } else if Double(right - mistake / highscoreCurrent) < 0.6 {
//                progressBar.progress = 0.6
//            } else if Double(right - mistake / highscoreCurrent) < 0.7 {
//                progressBar.progress = 0.7
//            } else if Double(right - mistake / highscoreCurrent) < 0.8 {
//                progressBar.progress = 0.8
//            } else if Double(right - mistake / highscoreCurrent) < 0.9 {
//                progressBar.progress = 0.9
//            } else if Double(right - mistake / highscoreCurrent) <= 1.0 {
//                progressBar.progress = 0.5
//                }
//        } else {
//            progressBar.isHidden = true
//        }
    }
    
    
    
    @IBAction func zeroClicked(_ sender: Any) {
        editing(i: "0")
        generator.impactOccurred()
    }
    
    @IBAction func oneClicked(_ sender: Any) {
        editing(i: "1")
        generator.impactOccurred()
    }
    
    @IBAction func twoClicked(_ sender: Any) {
        editing(i: "2")
        generator.impactOccurred()
    }
    
    @IBAction func threeClicked(_ sender: Any) {
        editing(i: "3")
        generator.impactOccurred()
    }
    
    @IBAction func fourClicked(_ sender: Any) {
        editing(i: "4")
        generator.impactOccurred()
    }
    
    @IBAction func fiveClicked(_ sender: Any) {
        editing(i: "5")
        generator.impactOccurred()
    }
    
    @IBAction func sixClicked(_ sender: Any) {
        editing(i: "6")
        generator.impactOccurred()
    }
    
    @IBAction func sevenClicked(_ sender: Any) {
        editing(i: "7")
        generator.impactOccurred()
    }
    
    @IBAction func eightClicked(_ sender: Any) {
        editing(i: "8")
        generator.impactOccurred()
    }
    
    @IBAction func nineClicked(_ sender: Any) {
        editing(i: "9")
        generator.impactOccurred()
    }
    
    func editing(i : String){
        if resultLabel.text == "İşlemin Sonucunu Girin" {
            resultLabel.text = i
        } else {
            resultLabel.text = String(resultLabel.text!) + i
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFinishVC"{
            let destinationVC = segue.destination as! FinishVC
            
            destinationVC.texting = right - mistake
            destinationVC.puan = highscoreCurrent
            
        
        }
    }
    
    func whiteBorderRad(i : UIView){
        i.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).cgColor
        i.layer.cornerRadius = 20
        i.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }
    
    func buttonNotSelec(i : UIButton){
        i.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).cgColor
        i.layer.cornerRadius = 7
        i.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        i.setTitleColor(UIColor.white, for: .normal)
      }
    
    func buttonSelec(i : UIButton){
        i.backgroundColor = UIColor.white
        i.layer.cornerRadius = 7
        i.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        i.setTitleColor(UIColor(red: 0.91, green: 0.42, blue: 0.49, alpha: 1.00), for: .normal)
    }
    
    func fullWhiteBorC(i : UIView){
        i.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
        i.layer.cornerRadius = 20
        i.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }
    
    func cornerRad(i : UIView){
        i.layer.cornerRadius = 20
        i.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }

}
