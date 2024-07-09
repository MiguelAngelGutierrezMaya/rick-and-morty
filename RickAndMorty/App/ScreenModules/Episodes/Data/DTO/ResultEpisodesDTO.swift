//
//  ResultEpisodesDTO.swift
//  RickAndMorty
//
//  Created by Miguel Angel Gutierrez Maya on 22/10/23.
//

struct ResultEpisodesDTO: Decodable {
    let info: InfoDTO
    let results: [EpisodeDTO]
}
