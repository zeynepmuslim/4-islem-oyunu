//
//  FinishVC.swift
//  4IslemOyunu
//
//  Created by Zeynep Müslim on 17.08.2020.
//  Copyright © 2020 Zeynep Müslim. All rights reserved.
//

import UIKit

class FinishVC: UIViewController {

    
    
    @IBOutlet weak var timeoverLabel: UILabel!
    
    @IBOutlet weak var skorView: UIView!
    @IBOutlet weak var skorLabelF: UILabel!
    @IBOutlet weak var comment: UITextView!
    @IBOutlet weak var playAgain: UIButton!
    
    @IBOutlet weak var backToMain: UIButton!
    
    @IBOutlet weak var levelOne: UIButton!
    @IBOutlet weak var levelTwo: UIButton!
    @IBOutlet weak var levelThree: UIButton!
    
    
    var texting = Int()
    var level = Int()
    var puan = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skorLabelF.text = "Skorun: \(texting)"
        
        
        
        
//        if String(level) == "" {
//            buttonSelec(i: levelTwo)
//            buttonNotSelec(i: levelOne)
//            buttonNotSelec(i: levelThree)
//        }
        
        
//        if let currentValue = NSUserDefaults.standardUserDefaults().objectForKey("Code"){
//            //Exists
//        }else{
//            //Doesn't exist
//        }
        
       
        let wi = view.frame.size.width
        let he = view.frame.size.height
        
        
        
        // kırmızı UIColor(red: 0.50, green: 0.67, blue: 0.93, alpha: 1.00)
        
//        mavi UIColor(red: 0.91, green: 0.42, blue: 0.49, alpha: 1.00).cgColor
        timeoverLabel.frame = CGRect(x: 0, y: he * 0.25, width: wi, height: he * 0.07 )
        skorView.frame = CGRect(x: wi * 0.5 - wi * 0.82 / 2 , y: he * 0.4, width: wi * 0.82, height: he * 0.08)
        skorLabelF.frame = CGRect(x: 0, y: 0, width: wi * 0.82, height: he * 0.08)
        comment.frame = CGRect(x: wi * 0.5 - wi * 0.82 / 2, y: he * 0.48, width: wi * 0.82, height: he * 0.1)
        playAgain.frame = CGRect(x: wi * 0.5 - wi * 0.82 / 2, y: he * 0.6, width: wi * 0.82, height: he * 0.08)
        backToMain.frame = CGRect(x: wi * 0.5 - wi * 0.82 / 2, y: he * 0.7, width: wi * 0.82, height: he * 0.08)
        
        levelOne.frame = CGRect(x: wi * 0.09,y: he * 0.8,width: wi * 0.213, height: he * 0.04)
        levelTwo.frame = CGRect(x: 2 * wi * 0.09 + wi * 0.213,y: he * 0.8,width: wi * 0.213, height: he * 0.04)
        levelThree.frame = CGRect(x: 3 * wi * 0.09 + wi * 0.213 * 2,y: he * 0.8,width: wi * 0.213, height: he * 0.04)
        
        
        backToMain.layer.borderWidth = 5
        backToMain.layer.borderColor = UIColor(red: 0.50, green: 0.67, blue: 0.93, alpha: 1.00).cgColor
        backToMain.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).cgColor
        
        cornerRad(i: skorView)
        cornerRad(i: playAgain)
        cornerRad(i: backToMain)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        level = UserDefaults.standard.integer(forKey: "level")
        
        
      
        
        
     
        if level != 1 && level != 2 && level != 3 {
            level = 2
        } else if level == 1 {
            buttonSelec(i: levelOne)
            buttonNotSelec(i: levelTwo)
            buttonNotSelec(i: levelThree)
        } else if level == 2 {
            buttonSelec(i: levelTwo)
            buttonNotSelec(i: levelThree)
            buttonNotSelec(i: levelOne)
        } else if level == 3 {
            buttonSelec(i: levelThree)
            buttonNotSelec(i: levelTwo)
            buttonNotSelec(i: levelOne)
        }
    
        
        
            if texting == puan {
                comment.text = "Bu leveldeki en yüksek skorunla aynı skoru yaptın! Biraz daha çabala!"
            } else if texting > puan {
                comment.text = "Bu leveldeki en yüksek skorun \(texting - puan) puan arttı!"
            } else if texting < puan {
                comment.text = "Bu leveldeki en yüksek skorun bundan \(puan - texting) puan fazla!"
            }
        
        
           
    
    
    }
    

    
    @IBAction func level1secildi(_ sender: Any) {
        buttonSelec(i: levelOne)
        buttonNotSelec(i: levelTwo)
        buttonNotSelec(i: levelThree)

        UserDefaults.standard.set(1, forKey: "level")
        level = UserDefaults.standard.integer(forKey: "level")
        print(level)
    }
    
    @IBAction func level2secildi(_ sender: Any) {
        buttonSelec(i: levelTwo)
        buttonNotSelec(i: levelThree)
        buttonNotSelec(i: levelOne)

        UserDefaults.standard.set(2, forKey: "level")
        level = UserDefaults.standard.integer(forKey: "level")
        print(level)
    }
    @IBAction func level3secildi(_ sender: Any) {
        buttonSelec(i: levelThree)
        buttonNotSelec(i: levelTwo)
        buttonNotSelec(i: levelOne)

        UserDefaults.standard.set(3, forKey: "level")
        level = UserDefaults.standard.integer(forKey: "level")
        print(level)
    }
    /*
     
     
    @IBAction func levelOneClicked(_ sender: Any) {
        buttonSelec(i: levelOne)
        buttonNotSelec(i: levelTwo)
        buttonNotSelec(i: levelThree)

        UserDefaults.standard.set(1, forKey: "level")
        level = UserDefaults.standard.integer(forKey: "level")
        print(level)
    }

    @IBAction func levelTwoClicked(_ sender: Any) {
        buttonSelec(i: levelThree)
        buttonNotSelec(i: levelTwo)
        buttonNotSelec(i: levelOne)

        UserDefaults.standard.set(3, forKey: "level")
        level = UserDefaults.standard.integer(forKey: "level")
        print(level)
    }

    @IBAction func levelThreeClicked(_ sender: Any) {
        buttonSelec(i: levelThree)
        buttonNotSelec(i: levelTwo)
        buttonNotSelec(i: levelOne)

        UserDefaults.standard.set(3, forKey: "level")
        level = UserDefaults.standard.integer(forKey: "level")
        print(level)
    }
     
    */
    
    
    func cornerRad(i : UIView){
           i.layer.cornerRadius = 20
           i.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
       }
    
    func buttonNotSelec(i : UIButton){
         i.layer.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).cgColor
         i.layer.cornerRadius = 7
         i.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        // i.setTitleColor(UIColor.white, for: .normal)
       }
     
     func buttonSelec(i : UIButton){
         i.backgroundColor = UIColor.white
         i.layer.cornerRadius = 7
         i.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
         i.setTitleColor(UIColor(red: 0.91, green: 0.42, blue: 0.49, alpha: 1.00), for: .normal)
     }
}
