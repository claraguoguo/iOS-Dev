//
//  SecondViewController.swift
//  PassDataBetweenVCs
//
//  Created by Clara Guo on 2021-12-02.
//

import UIKit

class SecondViewController: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Name: -"
        return label
    }()
    
    var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        /// Create UILabel programmatically
        view.addSubview(label)
        /// Note: need to define frame, otherwise the label won't show
        label.frame = CGRect(x: 0, y: 50, width: view.frame.size.width, height: 100)
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.setTitle("Set Name", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        
        /* #selector()
         selector is a word from Objective-C world and you are able to use it from Swift to
            have a possibility to call Objective-C from Swift. It allows you to execute some code at runtime.
            That's why we need to use @objc to declare function.
         */
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        observer = NotificationCenter.default.addObserver(forName: Notification.Name("myCustom"), object: nil, queue: .main, using: { notification in
            
            guard let object = notification.object as? [String: UIColor] else {
                return
            }
            
            guard let color = object["color"] else {
                return
            }
            self.view.backgroundColor = color
        })
    }
    
    @objc private func didTapButton() {
        let textEntry = TextEntryViewController()
        
        /// This is how we can get the text data back in this VC when TextEntryViewController calls the completion block
        textEntry.completion = { [weak self] text in
            /// Change UI on main thread
            DispatchQueue.main.async {
                self?.label.text = text
            }
        }
        let vc = UINavigationController(rootViewController: textEntry)
        present(vc, animated: true)
        
    }
    

}
