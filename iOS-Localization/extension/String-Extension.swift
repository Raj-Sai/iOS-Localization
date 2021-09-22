//
//  String-Extension.swift
//  iOS-Localization
//
//  Created by Amsaraj Mariyappan on 22/9/21.
//

import Foundation

public extension String {
    func localize(variables: [String: String]? = nil) -> String {
        return LanguageManager.shared.getI18nStringValue(of: self, variables: variables)
    }
}
