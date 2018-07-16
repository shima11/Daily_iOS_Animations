//
//  Day11ViewController.swift
//  DailyiOSAnimations
//
//  Created by jinsei shima on 2018/07/16.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day11ViewController: UIViewController {
    
    let targetView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        targetView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        targetView.center = view.center
        targetView.backgroundColor = .lightGray
        view.addSubview(targetView)
        
        let drag = UIPanGestureRecognizer(target: self, action: #selector(drag(_:)))
        targetView.addGestureRecognizer(drag)
        
        
    }
    
    @objc func drag(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
            
        case .changed:
            let translation = sender.translation(in: targetView)
            let velocity = sender.velocity(in: targetView)
            
            targetView.center = CGPoint(
                x: targetView.center.x + translation.x,
                y: targetView.center.y + translation.y
            )
            
            sender.setTranslation(.zero, in: targetView)
            
        default:
            break
        }
    }
}
