//
//  ThirdViewController.swift
//  PassDataBetweenVCs
//
//  Created by Clara Guo on 2021-12-02.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.setTitle("Fire Event", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        NotificationCenter.default.post(name: Notification.Name("myCustom"), object: ["color": UIColor.red])
    }

}
