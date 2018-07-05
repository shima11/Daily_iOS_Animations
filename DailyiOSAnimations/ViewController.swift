//
//  ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/05.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    let model = ["Day1"]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Daily iOS Animations"

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }

}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt:", indexPath)
    }
}
