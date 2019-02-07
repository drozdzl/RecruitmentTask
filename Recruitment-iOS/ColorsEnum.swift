//
//  ColorsEnum.swift
//  Recruitment-iOS
//
//  Created by Łukasz Drożdż on 07/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import UIKit

enum Colors: String, Decodable {
    case red =  "Red"
    case green = "Green"
    case blue = "Blue"
    case yellow = "Yellow"
    case purple = "Purple"
    
    var color: UIColor {
        switch self {
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
        case .yellow:
            return .yellow
        case .purple:
            return .purple
        }
    }
}
