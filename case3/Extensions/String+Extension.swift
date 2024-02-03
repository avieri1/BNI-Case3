//
//  String+Extension.swift
//  case3
//
//  Created by aldo on 02/02/24.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
