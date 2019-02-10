//
//  Item.swift
//  Recruitment-iOS
//
//  Created by Łukasz Drożdż on 07/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import UIKit

struct Item: ItemProtocol {
    let id: String
    let name: String
    let preview: String?
    let colorsEnum: Colors
}

extension Item: Decodable {
    enum CodingKeys: String, CodingKey  {
        case id
        case attributes
    }
    enum AttributesKeys: String, CodingKey {
        case name
        case preview
        case color
    }
    
    init(from decoder: Decoder) throws {
        let generalValues = try decoder.container(keyedBy: CodingKeys.self)
        let attributeValues = try generalValues.nestedContainer(keyedBy: AttributesKeys.self, forKey: .attributes)
        
        id = try generalValues.decode(String.self, forKey: .id)
        name = try attributeValues.decode(String.self, forKey: .name)
        preview = try? attributeValues.decode(String.self, forKey: .preview)
        colorsEnum = try attributeValues.decode(Colors.self, forKey: .color)
        
    }
    
}

