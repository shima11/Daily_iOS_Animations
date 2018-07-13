//
//  Day9ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/12.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day9ViewController: UIViewController {

    let targetView = UIView()

    let nextPoint = CGPoint(x: UIScreen.main.bounds.width / 2, y: 160)
    let firstPoint = CGPoint(x: UIScreen.main.bounds.width / 2, y: 500)

    @objc func didTapStartButton(_ sender: Any) {

        UIView.animate(withDuration: 2.0, animations: {
            self.targetView.center = self.nextPoint
        })
    }

    @objc func didTapReverseButton(_ sender: Any) {

        targetView.layer.removeAllAnimations()

        guard let presentationLayer = targetView.layer.presentation() else { return }
        targetView.center = presentationLayer.position

        UIView.animate(withDuration: 0.3, animations: {
            self.targetView.center = self.firstPoint
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        targetView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        targetView.center = firstPoint
        targetView.backgroundColor = .lightGray
        view.addSubview(targetView)

        let startButton = UIButton()
        startButton.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        startButton.center = CGPoint(x: UIScreen.main.bounds.width * 0.3, y: UIScreen.main.bounds.height * 0.9)
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.darkGray, for: .normal)
        startButton.addTarget(self, action: #selector(self.didTapStartButton(_:)), for: .touchUpInside)
        view.addSubview(startButton)

        let reverseButton = UIButton()
        reverseButton.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        reverseButton.center = CGPoint(x: UIScreen.main.bounds.width * 0.7, y: UIScreen.main.bounds.height * 0.9)
        reverseButton.setTitle("Reverse", for: .normal)
        reverseButton.setTitleColor(.darkGray, for: .normal)
        reverseButton.addTarget(self, action: #selector(self.didTapReverseButton(_:)), for: .touchUpInside)
        view.addSubview(reverseButton)

    }

}

