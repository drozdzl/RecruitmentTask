//
//  ItemDetails.swift
//  Recruitment-iOS
//
//  Created by Łukasz Drożdż on 07/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import Foundation

struct ItemDetails: ItemDetailsProtocol {
    let item: ItemProtocol
    let description: String
}

extension ItemDetails: Decodable {
    enum AttributesKeys: String, CodingKey {
        case description = "desc"
    }
    
    init(from decoder: Decoder) throws {
        let generalValues = try decoder.container(keyedBy: Item.CodingKeys.self)
        let att = try generalValues.nestedContainer(keyedBy: AttributesKeys.self, forKey: .attributes)
        
        description = try att.decode(String.self, forKey: .description)
        item = try Item(from: decoder)
    }
}
