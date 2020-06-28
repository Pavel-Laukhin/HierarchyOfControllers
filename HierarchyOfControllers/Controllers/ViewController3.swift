//
//  ViewController3.swift
//  HierarchyOfControllers
//
//  Created by Павел on 28.06.2020.
//  Copyright © 2020 Pavel Laukhin. All rights reserved.
//

import UIKit

final class ViewController3: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        return label
    }()
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Unwind", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        button.titleLabel?.textColor = .white
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        view.addSubview(label)
        view.addSubview(button)
    }
    
    //Выставляем фреймы лейблу и кнопке:
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        label.sizeToFit()
        label.frame = CGRect(
            x: (view.bounds.width - label.frame.width) / 2,
            y: view.bounds.height / 2 - 50,
            width: label.frame.width,
            height: label.frame.height
        )
        label.sizeToFit()
        
        button.sizeToFit()
        button.frame = CGRect(
            x: (view.bounds.width - button.frame.width) / 2,
            y: label.frame.maxY + 24,
            width: button.frame.width,
            height: button.frame.height
        )
    }
    
    // MARK: - Actions
    //Удяляем presentedView по нажанию кнопки:
    @objc private func buttonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}
