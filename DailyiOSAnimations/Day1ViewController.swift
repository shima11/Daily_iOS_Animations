//
//  Day1ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/05.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day1ViewController: UIViewController {
    
    @IBOutlet weak var targetView: UIView!
    @IBOutlet weak var button: UIButton!
    
    private var isPause: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.panEvent(_:)))
//        targetView.addGestureRecognizer(panGesture)
        
        targetView.layer.speed = 0
        targetView.layer.duration = 1
        targetView.layer.timeOffset = 0
        
    }

    @IBAction func didTapStartPause(_ sender: Any) {

        if isPause {
            button.setTitle("Pause", for: .normal)
        } else {
            button.setTitle("Start", for: .normal)
        }
        isPause = !isPause
    }
    
//    @objc func panEvent(_ sender: UIPanGestureRecognizer) {
//
//        let translation = sender.translation(in: view)
//        sender.view!.center = CGPoint(
//            x: sender.view!.center.x + translation.x,
//            y: sender.view!.center.y + translation.y
//        )
//        sender.setTranslation(.zero, in: view)
//    }
    
}
