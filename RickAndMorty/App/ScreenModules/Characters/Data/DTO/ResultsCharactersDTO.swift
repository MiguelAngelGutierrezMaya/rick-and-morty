//
//  ResultsCharactersDTO.swift
//  RickAndMorty
//
//  Created by Keybe on 19/06/23.
//

struct ResultsCharactersDTO: Decodable {
    let results: [CharactersDTO]
    let info: InfoDTO
}
