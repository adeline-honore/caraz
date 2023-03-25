//
//  NetworkProtocol.swift
//  Caraz
//
//  Created by HONORE Adeline on 24/03/2023.
//

import Foundation

protocol NetworkProtocol {
    func callNetwork(router: RouterProtocol, completionHandler: @escaping (Result<Data, Error>) -> ())
}
