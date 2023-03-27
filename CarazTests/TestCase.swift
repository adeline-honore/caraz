//
//  TestCase.swift
//  CarazTests
//
//  Created by HONORE Adeline on 27/03/2023.
//

import Foundation

enum TestCase {
    case weather
    case decodeFailure
        
    var resource: String {
        switch self {
        case .weather:
            return "Weather"
        default:
            return ""
        }
    }
}
