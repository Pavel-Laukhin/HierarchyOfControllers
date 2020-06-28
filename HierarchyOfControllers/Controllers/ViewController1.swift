//
//  ViewController1.swift
//  HierarchyOfControllers
//
//  Created by Павел on 28.06.2020.
//  Copyright © 2020 Pavel Laukhin. All rights reserved.
//

import UIKit

final class ViewController1: UIViewController {
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("toViewController3", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        button.titleLabel?.textColor = .white
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        addSubviews()
    }
    
    private func addSubviews() {
        view.addSubview(textField)
        view.addSubview(button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupSubviews()
    }
    
    // Делаем настройку фреймов у текстового поля и у кнопки:
    private func setupSubviews() {
        textField.sizeToFit()
        textField.frame = CGRect(
            x: (view.bounds.width - 200) / 2,
            y: (view.bounds.height - textField.frame.height) / 2,
            width: 200,
            height: textField.frame.height
        )
        button.sizeToFit()
        button.frame = CGRect(
            x: (view.bounds.width - button.frame.width) / 2,
            y: textField.frame.maxY + 20,
            width: textField.frame.width,
            height: textField.frame.height
        )
    }
    
    // MARK: - Actions
    @objc func buttonTapped() {
        let viewController3 = ViewController3()
        viewController3.label.text = textField.text // Передаем набранный текст
        viewController3.modalPresentationStyle = .fullScreen
        self.present(viewController3, animated: true, completion: nil)
        tabBarController?.selectedIndex = 1 // Это позволяет нам сделать эмуляцию Unwind: когда делаю dismiss у третьего контроллера, он удаляется, а там у нас уже стоит переключенный табБар на второй контроллер )))
    }
    
    // Метод, который убирает клавиатуру после того, как закончилось редактирование
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
