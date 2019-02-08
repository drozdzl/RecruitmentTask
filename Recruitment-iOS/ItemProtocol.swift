//
//  ItemProtocol.swift
//  Recruitment-iOS
//
//  Created by Łukasz Drożdż on 07/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import Foundation

protocol ItemProtocol: Decodable {
    var name: String { get }
    var preview: String? { get }
    var colorsEnum: Colors { get }
}
