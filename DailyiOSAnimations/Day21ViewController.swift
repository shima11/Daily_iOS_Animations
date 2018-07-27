//
//  Day21ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/25.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day21ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tile = CATiledLayer()
        tile.tileSize = CGSize(width: 100, height: 100)
        tile.levelsOfDetail = 100
        tile.levelsOfDetailBias = 100
        tile.backgroundColor = UIColor.lightGray.cgColor
        tile.contentsCenter = view.bounds
        view.layer.addSublayer(tile)

    }
}

private class CountLabel: UIView {

    private var nextLabels: [UILabel] = []
    private var currentLabels: [UILabel] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func count(from: Int, to: Int) {

    }

}
