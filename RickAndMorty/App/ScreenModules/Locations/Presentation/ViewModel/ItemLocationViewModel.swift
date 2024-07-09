//
//  ItemLocationViewModel.swift
//  RickAndMorty
//
//  Created by Keybe on 17/09/23.
//

struct ItemLocationViewModel {
    private(set) var location: Location
    
    var name: String {
        location.name
    }
    
    // TODO: - Remove estrings and use AppLocalized
    var dimension: String {
        return "Dimension: \(location.dimension ?? AppLocalized.unknown)"
    }
    
    var type: String {
        return "Type: \(location.type ?? AppLocalized.unknown)"
    }
}
