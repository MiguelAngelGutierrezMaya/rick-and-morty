//
//  PropertyIterator.swift
//  RickAndMorty
//
//  Created by Keybe on 30/04/23.
//

protocol PropertyIterator {
    
}

extension PropertyIterator {
    func dictionaryProperties() -> [String: Any] {
        let mirror = Mirror(reflecting: self)
        var dictionary: [String: Any] = [:]
        mirror.children.forEach { property in
            dictionary[property.label ?? String()] = property.value
        }
        
        return dictionary
    }
}
