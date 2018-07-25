//
//  Day19ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/23.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit
import Lottie

class Day19ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let animationView = LOTAnimationView(name: "data")
        animationView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        animationView.center = view.center
        view.addSubview(animationView)

        animationView.loopAnimation = true

        animationView.play{ (finished) in
            print("completion")
        }

    }
}
