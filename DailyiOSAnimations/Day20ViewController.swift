//
//  Day20ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/25.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit
import LTMorphingLabel

class Day20ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let label = LTMorphingLabel()
        label.text = "1000"
        label.morphingEffect = .evaporate
        label.textColor = .darkGray
        label.textAlignment = .center

        label.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        label.center = view.center
        view.addSubview(label)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            label.text = "1001"
        }
    }

}
