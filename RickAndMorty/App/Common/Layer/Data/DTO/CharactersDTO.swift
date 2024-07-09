//
//  CharactersDTO.swift
//  RickAndMorty
//
//  Created by Keybe on 19/06/23.
//

struct CharactersDTO: Decodable {
    let id: Int
    let name: String
    let status: String?
    let species: String?
    let image: String?
    let url: String
    let origin: OriginDTO
    let location: LocationDTO
}
