//
//  ChildViewController.swift
//  HierarchyOfControllers
//
//  Created by Павел on 28.06.2020.
//  Copyright © 2020 Pavel Laukhin. All rights reserved.
//

import UIKit

final class ChildViewController: UIViewController {
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        button.titleLabel?.textColor = .blue
        button.addTarget(nil, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(backButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        backButton.sizeToFit()
        backButton.frame = CGRect(
            x: (view.bounds.width - backButton.frame.width) / 2,
            y: (view.bounds.height - backButton.frame.height) / 2,
            width: backButton.frame.width,
            height: backButton.frame.height
        )
        backButton.sizeToFit()
    }
    
    // MARK: - Actions
    @objc private func backButtonTapped() {
        view.willMove(toSuperview: nil)
        view.removeFromSuperview()
        tabBarController?.tabBar.isHidden = false
        removeFromParent()
    }
    
}
