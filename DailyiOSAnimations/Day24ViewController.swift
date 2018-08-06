//
//  Day24ViewController.swift
//  DailyiOSAnimations
//
//  Created by jinsei shima on 2018/08/04.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

import EasyPeasy

class Day24ViewController: UIViewController {

    let scrollView: UIScrollView = .init()

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        navigationController?.delegate = self

        view.addSubview(scrollView)

        scrollView.backgroundColor = UIColor.lightGray
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000)
        scrollView.delegate = self

        scrollView.easy.layout(Edges())

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

}

extension Day24ViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("====================")
//        print(navigationController?.navigationBar.subviews)
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        print("<<<<<<<<<<<<<<<<<<<<<")
//        print(navigationController?.navigationBar.subviews)
    }

}
extension Day24ViewController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {

    }


    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

    }

    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}

extension Day24ViewController: UINavigationBarDelegate {
    func navigationBar(_ navigationBar: UINavigationBar, shouldPush item: UINavigationItem) -> Bool {
        return true
    }

    func navigationBar(_ navigationBar: UINavigationBar, didPush item: UINavigationItem) {

    }


    func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        return true
    }

    func navigationBar(_ navigationBar: UINavigationBar, didPop item: UINavigationItem) {
        
    }
}
