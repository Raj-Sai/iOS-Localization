//
//  Encodable-Extension.swift
//  iOS-Localization
//
//  Created by Amsaraj Mariyappan on 22/9/21.
//

import Foundation

public extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data,
                                                  options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }

}
