//
//  EpisodeDTO.swift
//  RickAndMorty
//
//  Created by Miguel Angel Gutierrez Maya on 22/10/23.
//

struct EpisodeDTO: Decodable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
    }
}
