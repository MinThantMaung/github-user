//
//  PList.swift
//  GitHub
//
//  Created by Min Thant on 10/09/2025.
//

import Foundation

enum PList{
    case baseUrl
    
    var value: String{
        switch self {
        case .baseUrl:
            return "Base URL"
        }
    }
}




