//
//  ViewController.swift
//  LJNormalAnimation_swift
//
//  Created by 杰刘 on 2018/5/11.
//  Copyright © 2018年 刘杰. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    let KScreenW = UIScreen.main.bounds.width
    let KScreenH = UIScreen.main.bounds.height
    
    var waveButton = WaveButton()
    var lightButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        waveButton = WaveButton.init(type: UIButtonType.custom)
        waveButton.frame = CGRect.init(x: 37.5 , y:100, width: KScreenW - 75 , height: 100)
        waveButton.layer.masksToBounds = true
        waveButton.layer.cornerRadius = 25
        self.view.addSubview(waveButton)
        
        lightButton = UIButton.init(type: UIButtonType.custom)
        lightButton.frame = CGRect.init(x: 37.5 , y: waveButton.frame.maxY + 15, width: KScreenW - 75, height: 50)
        lightButton.backgroundColor = UIColor.red
        LightnAnimation.setLightnAnimation(view: lightButton)
        self.view.addSubview(lightButton)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

