//
//  ViewController2.swift
//  HierarchyOfControllers
//
//  Created by Павел on 28.06.2020.
//  Copyright © 2020 Pavel Laukhin. All rights reserved.
//

import UIKit

final class ViewController2: UIViewController {

    private let buttonToViewController4: UIButton = {
        let button = UIButton()
        button.setTitle("toViewController4", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.titleLabel?.textColor = .white
        button.addTarget(nil, action: #selector(buttonToViewController4Tapped), for: .touchUpInside)
        return button
    }()
    private let buttonAddChildViewController: UIButton = {
        let button = UIButton()
        button.setTitle("addChildViewController", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.titleLabel?.textColor = .white
        button.addTarget(nil, action: #selector(buttonAddChildViewControllerTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        view.addSubview(buttonToViewController4)
        view.addSubview(buttonAddChildViewController)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        buttonToViewController4.sizeToFit()
        buttonToViewController4.frame = CGRect(
            x: (view.bounds.width - buttonToViewController4.frame.width) / 2,
            y: view.bounds.height / 2 - 50,
            width: buttonToViewController4.frame.width,
            height: buttonToViewController4.frame.height
        )
        buttonToViewController4.sizeToFit()
        
        buttonAddChildViewController.sizeToFit()
        buttonAddChildViewController.frame = CGRect(
            x: (view.bounds.width - buttonAddChildViewController.frame.width) / 2,
            y: buttonToViewController4.frame.maxY + 24,
            width: buttonToViewController4.frame.width,
            height: buttonToViewController4.frame.height
        )
        buttonAddChildViewController.sizeToFit()
    }
    
    // MARK: - Actions
    @objc private func buttonToViewController4Tapped() {
        let viewController4 = ViewController4()
        viewController4.modalPresentationStyle = .fullScreen
        self.present(viewController4, animated: true, completion: nil)
    }
    
    @objc private func buttonAddChildViewControllerTapped() {
        
        // Создаем дочерний контроллер:
        let childViewController = ChildViewController()
        
        // Устанавливаем дочерний контроллер:
        addChild(childViewController)
        
        // Добавляем представление дочернего контроллера на представление родительского контроллера:
        view.addSubview(childViewController.view)
        
        // Регистрируем дочерний контроллер:
        childViewController.didMove(toParent: self)
        
        // Скрываем таб бар, чтобы было, как на картинке из ДЗ:
        tabBarController?.tabBar.isHidden = true
    }

}
