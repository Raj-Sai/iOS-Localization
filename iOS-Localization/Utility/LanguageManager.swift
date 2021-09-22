//
//  LanguageManager.swift
//  iOS-Localization
//
//  Created by Amsaraj Mariyappan on 22/9/21.
//

import Foundation
import i18next

public class LanguageManager {
    
    private init() {}

    public static let shared: LanguageManager = {
        var manager = LanguageManager()
        manager.setup()
        return manager
    }()
    
    struct Constants {
        static let jsonFileName = "LanguagePack"
        static let jsonExtension = "json"
    }
    
    private let i18n = I18Next()
    private let i18nOptions = I18NextOptions()
    
    private func setup() {
        i18nOptions.lang = Language.tamil.rawValue
        i18nOptions.fallbackLang = Language.tamil.rawValue
    }
    

    // MARK: - Set default language
    public func initiateLanguagePack() {
        if let languagePackValues = fetchJsonFromBundle() {
            SharedAppContext.shared.language = i18nOptions.lang
            self.setLanguage(languagePackValues)
        }
    }
    
    private func fetchJsonFromBundle() -> LanguagePack? {
        if let fileUrl = self.getBundleJsonFileUrl() {
            do {
                let data = try Data(contentsOf: fileUrl)
                let decoder = JSONDecoder()
                let json = try decoder.decode(LanguagePack.self, from: data)
                return json
            } catch let jsonError {
                print("fetchJsonFromBundle is failed with : ",jsonError)
            }
        }
        return nil
    }
    
    private func getBundleJsonFileUrl() -> URL? {
        return Bundle(for: LanguageManager.self).url(forResource: Constants.jsonFileName,
        withExtension: Constants.jsonExtension)
    }
    
    public func changeLanguage(language: Language) {
        SharedAppContext.shared.language = language.rawValue
        i18nOptions.lang = language.rawValue
        i18n.load(options: i18nOptions.asDictionary()) { error in
            guard let i18nError = error else { return }
            print("setStoreLanguage is failed with : ",i18nError)
        }
    }
    
    public func setLanguage(_ languageModel: LanguagePack) {
        guard let dictionary = languageModel.dictionary, let contentDictionary = dictionary["content"] as? [String: Any] else { return }

        let transformedContentDictionary = getResourcesStore(dictionary: contentDictionary)
        i18nOptions.resourcesStore = transformedContentDictionary

        i18n.load(options: i18nOptions.asDictionary()) { error in
            guard let i18nError = error else { return }
            print("setStoreLanguage is failed with : ",i18nError)
        }
    }
    
    private func getResourcesStore(dictionary: [String: Any]) -> [String: Any] {
        var transformedDictionary = [String: Any]()
        var translations = [String: Any]()

        for (lang, str) in dictionary {
            translations["translation"] = str
            transformedDictionary[lang] = translations
        }

        return transformedDictionary
    }
    
    public func getI18nStringValue(of i18nKey: String, variables: [String: String]? = nil) -> String {
        let key = i18n.exists(i18nKey)
        if key, let args = variables {
            return i18n.t(i18nKey, variables: args)
        } else if key {
            return i18n.t(i18nKey)
        } else {
            return i18nKey
        }
    }
    
}
