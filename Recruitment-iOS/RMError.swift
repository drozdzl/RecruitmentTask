//
//  RMError.swift
//  Recruitment-iOS
//
//  Created by Łukasz Drożdż on 10/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import Foundation

enum RMError: Error {
    case jsonSerializationError
    case castingError
    
    var errorMessage: String {
        switch self {
        case .jsonSerializationError:
           return "There was a problem with json serialization, check your data"
        case .castingError:
            return "Could not cast data"
        }
    }
}
