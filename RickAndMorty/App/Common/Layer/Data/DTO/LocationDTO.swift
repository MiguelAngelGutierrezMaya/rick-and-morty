//
//  LocationDTO.swift
//  RickAndMorty
//
//  Created by Keybe on 19/06/23.
//

struct LocationDTO: Decodable {
    let name: String
    let type: String?
    let dimension: String?
    let url: String
}
