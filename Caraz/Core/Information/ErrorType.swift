//
//  ErrorType.swift
//  Caraz
//
//  Created by HONORE Adeline on 27/03/2023.
//

import Foundation

enum ErrorType: Error {
    case decodingError
    case locationManager
    case network
    case noInstruction
    case noRecipe
    case notAWord
    case notSaved
    case coredataError
}
