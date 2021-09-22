//
//  ViewController.swift
//  iOS-Localization
//
//  Created by Amsaraj Mariyappan on 22/9/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var languageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        welcomeLabel.text = "Hello_world".localize()
        languageButton.setTitle("language_button_title".localize(), for: .normal)
    }

    @IBAction func languageButtonTapped(_ sender: Any) {
        LanguageManager.shared.changeLanguage(language: SharedAppContext.shared.language == Language.tamil.rawValue ? .english : .tamil)
        setupUI()
    }
    
}

