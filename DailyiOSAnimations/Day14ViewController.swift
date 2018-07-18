//
//  Day14ViewController.swift
//  DailyiOSAnimations
//
//  Created by jinsei shima on 2018/07/18.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit
import pop

class Day14ViewController: UIViewController {
    
    let targetView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        
        
        targetView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        targetView.center = view.center
        targetView.backgroundColor = .lightGray
        view.addSubview(targetView)
        
//        let animation = POPSpringAnimation()
//        animation.property = POPAnimatableProperty.property(withName: kPOPViewCenter) as! POPAnimatableProperty
//        animation.toValue = NSValue(cgPoint: CGPoint(x: 0, y: 0))
//        animation.velocity = CGVector(dx: 100, dy: 100)
//        animation.delegate = self
//        targetView.layer.pop_add(animation, forKey: nil)
        
        if let anim = POPDecayAnimation(propertyNamed: kPOPViewCenter) {
            anim.velocity = 1000.0
            anim.toValue = NSValue(cgPoint: CGPoint(x: 100, y: 100))
            anim.deceleration = 0.8
            anim.delegate = self
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.targetView.layer.pop_add(anim, forKey: "slide")
            }
        }


    }
}

extension Day14ViewController: POPAnimationDelegate {
    
    func pop_animationDidStart(_ anim: POPAnimation!) {
        print("did start")
    }
    
    func pop_animationDidStop(_ anim: POPAnimation!, finished: Bool) {
        print("did stop")
    }
    
}
