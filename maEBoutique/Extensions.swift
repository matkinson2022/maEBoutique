//
//  Extensions.swift
//  maEBoutique
//
//  Created by Michael Atkinson on 2021-05-31.
//

import Foundation
extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
