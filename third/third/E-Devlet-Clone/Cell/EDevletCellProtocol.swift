//
//  EDevletCellProtocol.swift
//  third
//
//  Created by Melih Bugra Esmek on 20.09.2021.
//

import Foundation

protocol EDevletCellProtocol {
    static var reuseIdentifier: String { get }
    func configure(with edevlet:EDevlet?)
    
}
