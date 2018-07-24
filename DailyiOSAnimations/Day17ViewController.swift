//
//  Day17ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/22.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day17ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterPosition = view.center
        emitterLayer.emitterShape = kCAEmitterLayerLine
        emitterLayer.emitterSize = view.bounds.size

        let emitterCell = CAEmitterCell()
        emitterCell.birthRate = 100
        emitterCell.lifetime = 3
        emitterCell.velocity = 40
        emitterCell.scale = 0.2
        emitterCell.emissionRange = CGFloat.pi * 2
        emitterCell.color = UIColor.darkGray.cgColor

        let target = UIView()
        target.backgroundColor = .darkGray

        target.frame = CGRect(x: 0, y: 0, width: 8, height: 32)
        UIGraphicsBeginImageContextWithOptions(target.frame.size, true, 1)
        target.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        emitterCell.contents = image?.cgImage

        emitterLayer.emitterCells = [emitterCell]

        view.layer.addSublayer(emitterLayer)

    }
}
