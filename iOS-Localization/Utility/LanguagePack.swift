//
//  LanguagePack.swift
//  iOS-Localization
//
//  Created by Amsaraj Mariyappan on 22/9/21.
//

import Foundation

public class SharedAppContext {
    public static var shared = SharedAppContext()
    public var language: String = Language.tamil.getLanguageCode()
}

public struct LanguagePack: Codable {
    
    let content: Content
    
    public init(content: Content){
        self.content = content
    }
}

public struct Content: Codable {
    let en, ta: [String: String]
    public init(en: [String: String], ta: [String: String]){
        self.en = en
        self.ta = ta
    }
}

public enum Language: String {
    case english = "en"
    case tamil = "ta"
    
    public func getLanguageCode() -> String {
        switch self {
        case .english:
            return "en-EN" // english language code
        case .tamil:
            return "ta-IN" // indian tamil language code
        }
    }
}

// locale idenetifiers
public enum LocaleIdentifier: String {
    case ta = "ta_IN"
    case en = "en_US"
    case posix = "en_US_POSIX"
}


