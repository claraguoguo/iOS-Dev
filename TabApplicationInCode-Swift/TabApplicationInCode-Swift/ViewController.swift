//
//  ViewController.swift
//  TabApplicationInCode-Swift
//
//  Created by Clara Guo on 2021-12-15.
//

import UIKit

class ViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        button.addTarget(self,
                         action: #selector(didTapButton),
                         for: .touchUpInside)
        button.center = view.center
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        button.center = view.center
//    }


    @objc func didTapButton() {
        // Create and present tab bar controller
        let tabBarVC = UITabBarController()
        
        // https://stackoverflow.com/a/69739619
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            
            let tabBarItemAppearance = UITabBarAppearance()
            tabBarItemAppearance.backgroundColor = .white
            UITabBar.appearance().standardAppearance = tabBarItemAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarItemAppearance
        }
       
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        vc1.title = "Home"
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        vc2.title = "Contact"
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        vc3.title = "Help"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        
        guard let items = tabBarVC.tabBar.items else {
            return
            
        }
        let icons = ["house", "bell", "person.circle"]

        for x in 0..<items.count {
            items[x].badgeValue = String(x + 1)
            items[x].image = UIImage(systemName: icons[x])
        }

        present(tabBarVC, animated: true)
        
    }

}

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "home"
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "contact"
    }
}


class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "help"
    }
}
