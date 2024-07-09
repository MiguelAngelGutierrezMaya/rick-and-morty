//
//  Reusable.swift
//  RickAndMorty
//
//  Created by Keybe on 4/04/23.
//

protocol Reusable {
    
}

extension Reusable {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
