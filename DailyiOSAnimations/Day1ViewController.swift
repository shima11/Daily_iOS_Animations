//
//  Day1ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/05.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day1ViewController: UIViewController {
    
    var targetView = UIView()
    
    private var isPause: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        targetView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        targetView.center = view.center
        targetView.backgroundColor = UIColor.lightGray

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.panEvent(_:)))
        targetView.addGestureRecognizer(panGesture)

        view.addSubview(targetView)
    }
    
    @objc func panEvent(_ sender: UIPanGestureRecognizer) {

        guard
            let targetView = sender.view,
            let view = sender.view?.superview
            else {
                return
        }
        
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        
        print(translation, velocity)
        
        targetView.center = CGPoint(
            x: targetView.center.x + translation.x,
            y: targetView.center.y + translation.y
        )
        
        sender.setTranslation(.zero, in: view)
    }
    
}
