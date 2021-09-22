//
//  BundleandExtensions.swift
//  third
//
//  Created by Melih Bugra Esmek on 20.09.2021.
//

import Foundation

extension Bundle{
    
    func decode<T: Decodable> (_ type: T.Type, from file:String)->T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to \(file) from bundle")
        }
        let decoder = JSONDecoder()
        
        guard let contents = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        return contents
    }
}
