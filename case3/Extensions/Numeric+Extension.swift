//
//  Numeric+Extension.swift
//  case3
//
//  Created by aldo on 02/02/24.
//

import Foundation

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
