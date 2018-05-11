//
//  LightnAnimation.swift
//  LJNormalAnimation_swift
//
//  Created by 杰刘 on 2018/5/11.
//  Copyright © 2018年 刘杰. All rights reserved.
//

import UIKit

class LightnAnimation: NSObject {
    
    static func setLightnAnimation (view:UIView) {
        
        let bcview = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 80, height: 50))
        bcview.isUserInteractionEnabled = true
        bcview.image = UIImage.init(named: "light.png")
        view.addSubview(bcview)
        
        let moveAnimation = CABasicAnimation.init(keyPath: "transform.translation.x")
        moveAnimation.toValue = view.frame.size.width - 80
        moveAnimation.duration = 1.5
        moveAnimation.repeatCount = MAXFLOAT
        moveAnimation.autoreverses = false
        moveAnimation.isRemovedOnCompletion = false
        moveAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        bcview.layer.add(moveAnimation, forKey: nil)
        
    }

}
