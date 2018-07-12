//
//  Day9ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/12.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day9ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let targetView = UIView()
        targetView.backgroundColor = .lightGray
        targetView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        targetView.center = view.center
        view.addSubview(targetView)

        targetView.transform = CGAffineTransform(rotationAngle: 0.2)

        print(targetView.frame, targetView.bounds)
        print(targetView.layer.frame, targetView.layer.bounds)

    }
}
