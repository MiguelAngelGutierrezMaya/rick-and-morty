//
//  ResultLocationsDTO.swift
//  RickAndMorty
//
//  Created by Keybe on 14/09/23.
//

struct ResultLocationsDTO: Decodable {
    let info: InfoDTO
    let results: [LocationDTO]
}
