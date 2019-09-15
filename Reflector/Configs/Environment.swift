//
//  Environment.swift
//  Reflector
//
//  Created by derrick rocha on 9/14/19.
//  Copyright © 2019 Bhollo. All rights reserved.
//

import Foundation

public enum Environment{
    
    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let admobUnitId = "AdMobUnitId"
            static let type = "appType"
        }
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()

    // MARK: - Plist values
    static let adMobUnitId: String = {
        guard let id = Environment.infoDictionary[Keys.Plist.admobUnitId] as? String else{
            fatalError("Admob unit id not set for this environment")
        }
        return id
    }()
    
    // MARK: - Plist values
    static let isPaid: Bool = {
        guard let type = Environment.infoDictionary[Keys.Plist.type] as? String else{
                fatalError("App type not set for this enironment")
        }
        if(type == "free"){
            return false
        }
        else{
            return true
        }
    }()
}
