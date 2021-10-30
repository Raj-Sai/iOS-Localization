//
//  ViewController.swift
//  iOS-Localization
//
//  Created by Amsaraj Mariyappan on 22/9/21.
//

import UIKit

open class Test {
    public static let shared = Test()
    
    public func localize(_ key: String) -> String {
        return ""
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var languageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        //welcomeLabel.text = L10n.helloWorld.localize()
       // languageButton.setTitle(L10n.languageButtonTitle.localize(), for: .normal)
    }

    @IBAction func languageButtonTapped(_ sender: Any) {
        LanguageManager.shared.changeLanguage(language: SharedAppContext.shared.language == Language.tamil.rawValue ? .english : .tamil)
        setupUI()
    }
    
}

