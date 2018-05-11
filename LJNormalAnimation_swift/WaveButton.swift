//
//  WaveButton.swift
//  bcnews
//
//  Created by 杰刘 on 2018/5/11.
//  Copyright © 2018年 onchaintech. All rights reserved.
//

import UIKit

//extension WaveButton,CAAnimationDelegate {
//    var shapeLayer = CAShapeLayer()
//
//}

class WaveButton: UIButton,CAAnimationDelegate{
    
    var shapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(touchedDown(btn:event:)), for: UIControlEvents.touchDown)
        
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func touchedDown(btn:UIButton,event:UIEvent) {
      shapeLayer.removeFromSuperlayer()
        let touch = event.allTouches?.first
        let touchePoint = touch?.location(in: btn)
        let maxX = (touchePoint?.x)! > (self.frame.size.width - (touchePoint?.x)!) ? touchePoint?.x : (self.frame.size.width - (touchePoint?.x)!)
        let maxY = (touchePoint?.y)! > (self.frame.size.width - (touchePoint?.y)!) ? touchePoint?.y : (self.frame.size.height-(touchePoint?.y)!)
        let circleWidth = CGFloat(maxX!) > CGFloat(maxY!) ? maxX : maxY
        let path = UIBezierPath.init(roundedRect: CGRect.init(x: -CGFloat(circleWidth!), y: -CGFloat(circleWidth!), width: circleWidth! * 2 , height: circleWidth! * 2), cornerRadius: circleWidth!)
        
        shapeLayer = CAShapeLayer.init()
        shapeLayer.opacity = 0.5
        shapeLayer.lineWidth = 0.0
        shapeLayer.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
        shapeLayer.position = touchePoint!
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        self.layer.masksToBounds = true
        
        let scaleAnimation = CABasicAnimation.init(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 1
        scaleAnimation.duration = 0.5
        scaleAnimation.delegate = self
        shapeLayer.add(scaleAnimation, forKey: "animation")
        
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            shapeLayer.removeFromSuperlayer()
        }
    }
    
}
