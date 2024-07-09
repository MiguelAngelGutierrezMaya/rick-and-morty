//
//  MenuDTO.swift
//  RickAndMorty
//
//  Created by Keybe on 30/04/23.
//

struct MenuDTO: Decodable {
    let characters: String
    let locations: String
    let episodes: String
}

extension MenuDTO: PropertyIterator {}
