//
//  StringExtension.swift
//  Recruitment-iOS
//
//  Created by Łukasz Drożdż on 11/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import Foundation

extension String {
    var changedTitle: String {
        var newTitle = String()
        for (index, letter) in self.enumerated() {
            let newLetter = index % 2 == 0 ? String(letter).uppercased() : String(letter).lowercased()
            newTitle += newLetter
        }
        return newTitle
    }
}
