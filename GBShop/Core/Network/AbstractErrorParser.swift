//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Ekaterina on 11.04.21.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
