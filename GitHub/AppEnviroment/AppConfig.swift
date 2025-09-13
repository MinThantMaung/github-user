//
//  AppConfig.swift
//  GitHub
//
//  Created by Min Thant on 11/09/2025.
//

import Foundation

enum AppConfig {
    static var baseUrl: String{
        return configuration(.baseUrl)
    }
    
    private static func configuration(_ key: PList) -> String {
        if let infoDictionary = Bundle.main.infoDictionary{
            return infoDictionary[key.value] as? String ?? "\(key.value)"
        }else{
            fatalError("Unable to load")
        }
    }
}
