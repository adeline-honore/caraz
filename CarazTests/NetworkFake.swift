//
//  NetworkFake.swift
//  CarazTests
//
//  Created by HONORE Adeline on 27/03/2023.
//

import Foundation
@testable import Caraz
import UIKit

class NetworkFake: NetworkProtocol {
    
    private let testCase : TestCase
    private let jsonExtensionType = "json"
    private let imageExtensionType = "png"
    private var isFailed: Bool = false
    
    init(testCase: TestCase, isFailed: Bool = false) {
        self.testCase = testCase
        self.isFailed = isFailed
    }
    
    
    func callNetwork(router: Caraz.RouterProtocol, completionHandler: @escaping (Result<Data, Error>) -> ()) {
        
         guard !isFailed else { return completionHandler(.failure(ErrorType.network)) }
         
        switch testCase {
        case .weather:
            return completionHandler(.success(prepareData()))
        case .decodeFailure:
            return completionHandler(.success("test".data(using: .utf8)!))
        
        }
    }
    
    private func prepareData() -> Data {
        let bundle = Bundle(for: NetworkFake.self)
        let url = bundle.url(forResource: testCase.resource, withExtension: jsonExtensionType)!
        return try! Data(contentsOf: url)
    }
}
