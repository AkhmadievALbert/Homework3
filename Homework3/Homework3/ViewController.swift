//
//  ViewController.swift
//  Homework3
//
//  Created by a.akhmadiev on 24.10.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        buildView()
    }


    // MARK: Private

    private func buildView() {
        let factory = AnyFactory(ViewFactory())
        let view = factory.build(with: ViewFactory.Context(color: .red))
        self.view = view
    }
}

