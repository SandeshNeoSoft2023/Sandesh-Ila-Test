//
//  DecodeData.swift
//  IlaAssignment
//
//  Created by Neosoft on 25/06/24.
//

import Foundation

extension Decodable {
    static func decode(data: Data) throws -> Self {
        let decoder = JSONDecoder()
        return try decoder.decode(self, from: data)
    }
}
