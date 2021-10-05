//
//  MainMenuVC.swift
//  4IslemOyunu
//
//  Created by Zeynep Müslim on 17.08.2020.
//  Copyright © 2020 Zeynep Müslim. All rights reserved.
//

import UIKit

class MainMenuVC: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var hello: UILabel!
    @IBOutlet weak var dontForgetStory: UITextView!
    @IBOutlet weak var developedGame: UIButton!
    @IBOutlet weak var oldGame: UIButton!
    @IBOutlet weak var myStory: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        myStory.isHidden = true
        dontForgetStory.isHidden = true
        
        let blue = UIColor(red: 0.50, green: 0.67, blue: 0.93, alpha: 1.00).cgColor
        let red = UIColor(red: 0.91, green: 0.42, blue: 0.49, alpha: 1.00).cgColor
        let white = UIColor(red: 1, green: 1, blue: 1, alpha: 1.00).cgColor
        let halfWhite = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6).cgColor

        let wi = view.frame.size.width
        let he = view.frame.size.height

        headerLabel.frame = CGRect(x: 0, y: he * 0.2, width: wi, height: he * 0.07 )
        hello.frame = CGRect(x: 0 , y: he * 0.3, width: wi, height: he * 0.08)
        dontForgetStory.frame = CGRect(x: wi * 0.5 - wi * 0.82 / 2, y: he * 0.35, width: wi * 0.82, height: he * 0.1)
        developedGame.frame = CGRect(x: wi * 0.5 - wi * 0.82 / 2, y: he * 0.6, width: wi * 0.82, height: he * 0.08)
        developedGame.layer.borderWidth = 0
        developedGame.layer.borderColor = white
        oldGame.frame = CGRect(x: wi * 0.5 - wi * 0.82 / 2, y: he * 0.7, width: wi * 0.82, height: he * 0.08)
        
        
        oldGame.layer.borderWidth = 5
        oldGame.layer.borderColor = red
        oldGame.layer.backgroundColor = halfWhite
        myStory.frame = CGRect(x: wi * 0.5 - wi * 0.82 / 2, y: he * 0.8, width: wi * 0.82, height: he * 0.08)
        myStory.layer.borderWidth = 5
        myStory.layer.borderColor = blue
        myStory.layer.backgroundColor = halfWhite
        
        
        
        cornerRad(i: developedGame)
        cornerRad(i: oldGame)
        cornerRad(i: myStory)
        
        
    }
    
    func cornerRad(i : UIView){
        i.layer.cornerRadius = 20
        i.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }

}
