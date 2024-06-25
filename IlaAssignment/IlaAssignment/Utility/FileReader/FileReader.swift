//
//  FetchData.swift
//  IlaAssignment
//
//  Created by Neosoft on 25/06/24.
//

import Foundation

protocol FileReaderProtocol {
    func readFile<T:Codable>(fileName: String, fileExt: String) -> (T?)
}

class FileReader: FileReaderProtocol {
    func readFile<T:Codable>(fileName: String, fileExt: String) -> (T?) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExt) else { return nil }
        do {
            guard let data = try? Data(contentsOf: url) else { return nil }
            let model: T = try JSONDecoder().decode(T.self, from: data )
            return model
        } catch _ {
            return nil
        }
    }
}

