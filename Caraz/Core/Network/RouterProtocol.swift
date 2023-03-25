//
//  RouterProtocol.swift
//  Caraz
//
//  Created by HONORE Adeline on 24/03/2023.
//

import Foundation

protocol RouterProtocol {
    var baseURL: String { get }
    func buildParams() -> URL?
    func asUrlRequest() -> URLRequest?
}
